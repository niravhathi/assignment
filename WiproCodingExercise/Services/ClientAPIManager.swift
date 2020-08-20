//
//  ClientAPIManager.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/19/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit

enum APIError: Swift.Error {
  case objectWasUnexpectedlyDeallocated
  case failedToCreateURL
  case invalidResponse(response: URLResponse?)
  case networkError(error: Swift.Error, response: URLResponse?)
  case parsingError(error: String)
}

class ClientAPIManager: NSObject {
    private let urlSession = URLSession.shared
    var cachedUrl: URL?
    func getDataWith(for URLEndPoint:String, parameters: [String: String], completionSuccess: @escaping (Data) -> Void, completionFailure: @escaping (APIError) -> Void) {
        guard let url = URL(
                string:URLEndPoint
            ) else {
                return completionFailure(.failedToCreateURL)
            }
        self.cachedUrl = url
        var components = URLComponents(string: url.absoluteString)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        urlSession.dataTask(with: components.url!) { (data, response, error) in

            guard error == nil
                else {
                    return completionFailure(.parsingError(error: error?.localizedDescription ?? ""))
            }
            guard let data = data
                else {
                    return completionFailure(.parsingError(error: error?.localizedDescription ?? "There are no new Items to show"))
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    completionSuccess(data)

                }
            } catch let error {

                return completionFailure(.parsingError(error: error.localizedDescription))
            }
            }.resume()
    }
}
let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {

    var imageURL: URL?
    let activityIndicator = UIActivityIndicatorView()
    
    func loadImageWithUrl(_ url: URL) {

        // setup activityIndicator...
        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url

        image = nil
        activityIndicator.startAnimating()

        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        // image does not available in cache.. so retrieving it from url...
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                DispatchQueue.main.async(execute: {
                    self.activityIndicator.stopAnimating()
                })
                return
            }

            DispatchQueue.main.async(execute: {

                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                    if self.imageURL == url {
                        self.image = imageToCache
                    }

                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                self.activityIndicator.stopAnimating()
            })
        }).resume()
    }
}
