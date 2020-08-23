//
//  DetailViewModel.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/23/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

class DetailViewModel {
    var trackDetail: TrackDetails?
    var albumDetail: AlbumDetails?
    var artistDetail: ArtistDetails?
    var mbid: String?
    lazy var endPoint: String = {
        return "\(apiURL)\(endPointURL)"
    }()
    var clientAPIManager = ClientAPIManager()
    func fetchDetail(type: SearchTerm, completion: @escaping (Bool) -> Void) {
        var parameters: [String: String]?
        switch type {
        case .album:
            parameters = [apiKey:apiKeyValue, formatKey: "json",  methodKey: "album.getinfo", mbidKey: mbid ?? ""]
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters ?? [:], completionSuccess: { (data) in
                
                do {
                    self.albumDetail = try AlbumDetails(data: data)
                    completion(true)
                } catch {
                    completion(false)
                }
            }) { (error) in
                completion(false)
            }
            break
        case .track:
            parameters = [apiKey:apiKeyValue, formatKey: "json",  methodKey: "track.getinfo", mbidKey: mbid ?? ""]
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters ?? [:], completionSuccess: { (data) in
                
                do {
                    self.trackDetail = try TrackDetails(data: data)
                    completion(true)
                } catch {
                    completion(false)
                }
            }) { (error) in
                completion(false)
            }
            break
        case .artist:
            parameters = [apiKey:apiKeyValue, formatKey: "json",  methodKey: "artist.getinfo", mbidKey: mbid ?? ""]
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters ?? [:], completionSuccess: { (data) in
                do {
                    if let jsonObj = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                        jsonObj
                    }
                    self.artistDetail = try ArtistDetails(<#T##json: String##String#>)
                    completion(true)
                } catch {
                    completion(false)
                } 
            }) { (error) in
                completion(false)
            }
            break
        }
    }
    func getNumberofItemRows(type: SearchTerm) -> Int {
        switch  type{
        case .album:
            return self.albumDetail?.album?.tracks?.track?.count ?? 0
        case .track:
            return 0
        case .artist:
            return self.artistDetail?.artist?.similar?.artist?.count ?? 0
        }
    }
    func getArtistRows(for section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return getNumberofItemRows(type: .artist)
        case 3:
            return 1
        case 4:
            return 3
        default:
            return 0
        }
    }
    func getAlbumRows(for section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return getNumberofItemRows(type: .album)
        case 3:
            return 1
        case 4:
            return 3
        default:
            return 0
        }
    }
    func getTracksRows(for section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 3
        default:
            return 0
        }
    }
    
}
