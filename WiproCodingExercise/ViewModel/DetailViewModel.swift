//
//  DetailViewModel.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/23/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel {
    var trackDetail: TrackDetails?
    var albumDetail: AlbumDetails?
    var artistDetail: ArtistDetails?
    var mbid: String?
    lazy var endPoint: String = {
        return "\(apiURL)\(endPointURL)"
    }()
    var type: SearchTerm?
    var clientAPIManager = ClientAPIManager()
    func fetchDetail(type: SearchTerm, completion: @escaping (Bool) -> Void) {
        var parameters: [String: String]?
        self.type = type
        switch type {
        case .album:
            parameters = [apiKey:apiKeyValue, formatKey: "json",  methodKey: "album.getinfo", mbidKey: mbid ?? ""]
            clientAPIManager.getDataWith(for: endPoint, parameters: parameters ?? [:], completionSuccess: { (data) in
                
                do {
                   let jsonDecoder = JSONDecoder()
                    self.albumDetail = try jsonDecoder.decode(AlbumDetails.self, from: data)
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
                   let jsonDecoder = JSONDecoder()
                    self.trackDetail = try jsonDecoder.decode(TrackDetails.self, from: data)
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
                    let jsonDecoder = JSONDecoder()
                    self.artistDetail = try jsonDecoder.decode(ArtistDetails.self, from: data)
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
            return 1
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
            return 1
        case 4:
            return 3
        default:
            return 0
        }
    }
    func getCell(forTableView tableView: UITableView, withIndexPath indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let iCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            if self.type == .album {
                iCell.setImageData(type: .album, album: self.albumDetail, track: nil, artist: nil)
            } else if self.type == .artist {
                iCell.setImageData(type: .artist, album: nil, track: nil, artist: self.artistDetail)
            } else {
                iCell.setImageData(type: .track, album: nil, track: self.trackDetail, artist: nil)
            }
           return iCell
        }
        else if indexPath.section == 1 {
            let iCell = tableView.dequeueReusableCell(withIdentifier: "DetailListTableViewCell", for: indexPath) as! DetailListTableViewCell
            if indexPath.row == 0 {
                if self.type == .album {
                    iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .name)
                } else if self.type == .artist {
                    iCell.setData(type: .artist, album: nil, track: nil, artist: self.artistDetail, cellType: .name)
                } else {
                    iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .name)
                }
            } else {
                if self.type == .album {
                    iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .artist)
                } else {
                    iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .artist)
                }
                
            }
            return iCell
        } else if indexPath.section == 2 {
             let iCell = tableView.dequeueReusableCell(withIdentifier: "DetailListTableViewCell", for: indexPath) as! DetailListTableViewCell
            if self.type == .album {
                if let trackDetail = self.albumDetail?.album?.tracks?.track?[indexPath.row] {
                    iCell.setListData(type: .album, album: trackDetail, artist: nil, trackAlbum: nil)
                }
                
            } else if self.type == .artist {
                if let similarArtist = self.artistDetail?.artist?.similar?.artist?[indexPath.row] {
                    iCell.setListData(type: .artist, album: nil, artist: similarArtist, trackAlbum: nil)
                }
            } else if self.type == .track {
                if let album = self.trackDetail?.track?.album {
                    iCell.setListData(type: .track, album: nil, artist: nil, trackAlbum: album)
                }
            }
            return iCell
        } else if indexPath.section == 3 {
              let iCell = tableView.dequeueReusableCell(withIdentifier: "DetailListTableViewCell", for: indexPath) as! DetailListTableViewCell
            if self.type == .album {
                iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .tag)
            } else if self.type == .artist {
                iCell.setData(type: .artist, album: nil, track: nil, artist: self.artistDetail, cellType: .tag)
            } else {
                iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .tag)
            }
           return iCell
        } else if indexPath.section == 4 {
            let iCell = tableView.dequeueReusableCell(withIdentifier: "DetailListTableViewCell", for: indexPath) as! DetailListTableViewCell
            if indexPath.row == 0 {
                if self.type == .album {
                    iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .publish)
                } else if self.type == .artist {
                    iCell.setData(type: .artist, album: nil, track: nil, artist: self.artistDetail, cellType: .publish)
                } else {
                    iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .publish)
                }
            } else if indexPath.row == 1 {
                if self.type == .album {
                    iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .bio)
                } else if self.type == .artist {
                    iCell.setData(type: .artist, album: nil, track: nil, artist: self.artistDetail, cellType: .bio)
                } else {
                    iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .bio)
                }
                
            } else if indexPath.row == 2 {
                if self.type == .album {
                    iCell.setData(type: .album, album: self.albumDetail, track: nil, artist: nil, cellType: .content)
                } else if self.type == .artist {
                    iCell.setData(type: .artist, album: nil, track: nil, artist: self.artistDetail, cellType: .content)
                } else {
                    iCell.setData(type: .track, album: nil, track: self.trackDetail, artist: nil, cellType: .content)
                }
            }
            return iCell
        }
        return UITableViewCell()
    }
    func getHeight(forTableView tableView: UITableView, withIndexPath indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        } 
        return UITableView.automaticDimension
    }
}
