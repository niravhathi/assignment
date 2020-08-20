//
//  SearchViewModel.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation
import KRProgressHUD

class SearchViewModel {
    var pageNumberArtists = 0
    var pageNumberTracks = 0
    var pageNumberAlbums = 0
    var artists: Artists?
    var tracks: Tracks?
    var albums: Albums?
    lazy var endPoint: String = {
        return "\(apiURL)\(endPointURL)"
    }()
    var clientAPIManager = ClientAPIManager()
    
    func fetchDataArtists(searchText: String, completion: @escaping (Bool) -> Void) {
        let parameters = [apiKey:apiKeyValue, formatKey: "json", SearchTerm.artist.rawValue: searchText, methodKey: "artist.search"]
        if NetworkManager.shared.isReachableNetwork() {
            //KRProgressHUD.show()
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters, completionSuccess: { (result) in
                 //KRProgressHUD.dismiss()
                do {
                    self.artists = try Artists(data: result)
                    completion(true)
                } catch {
                    completion(false)
                }
               
            }) { (error) in
                completion(false)
                //KRProgressHUD.dismiss()
            }
        } else {
            completion(false)
            //KRProgressHUD.dismiss()
        }
    }
    
    func fetchDataTracks(searchText: String, completion: @escaping (Bool) -> Void) {
        let parameters = [apiKey:apiKeyValue, formatKey: "json", SearchTerm.track.rawValue: searchText, methodKey: "track.search"]
        if NetworkManager.shared.isReachableNetwork() {
            //KRProgressHUD.show()
           
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters, completionSuccess: { (result) in
                 //KRProgressHUD.dismiss()
                do {
                    self.tracks = try Tracks(data: result)
                    completion(true)
                } catch {
                    completion(false)
                   
                }
               
            }) { (error) in
                //KRProgressHUD.dismiss()
                completion(false)
               
            }
        } else {
            completion(false)
            //KRProgressHUD.dismiss()
        }
    }
    
    func fetchDataAlbums(searchText: String, completion: @escaping (Bool) -> Void) {
        let parameters = [apiKey:apiKeyValue, formatKey: "json", SearchTerm.album.rawValue: searchText, methodKey: "album.search"]
        if NetworkManager.shared.isReachableNetwork() {
            //KRProgressHUD.show()
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters, completionSuccess: { (result) in
                 //KRProgressHUD.dismiss()
                do {
                    self.albums = try Albums(data: result)
                    completion(true)
                } catch {
                    completion(false)
                  
                }
               
            }) { (error) in
                //KRProgressHUD.dismiss()
                completion(false)
            }
        } else {
            completion(false)
            //KRProgressHUD.dismiss()
        }
    }
    func getCount(searchTerm: SearchTerm) -> Int {
        switch searchTerm {
        case .album:
            return albums?.results?.albummatches?.album?.count ?? 0
        case .artist:
            return artists?.results?.artistmatches?.artist?.count ?? 0
        case .track:
            return tracks?.results?.trackmatches?.track?.count ?? 0
        }
    }
}
