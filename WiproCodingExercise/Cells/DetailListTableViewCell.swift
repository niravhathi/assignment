//
//  DetailListTableViewCell.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/23/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit

class DetailListTableViewCell: UITableViewCell {
   
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(type: SearchTerm, album: AlbumDetails?, track: TrackDetails?, artist: ArtistDetails?, cellType: CellType) {
        switch type {
        case .album:
            if cellType == .name {
                self.titleLabel.text = "Name"
                self.detailLabel.text = album?.album?.name
            } else if cellType == .artist {
                self.titleLabel.text = "Artist"
                self.detailLabel.text = album?.album?.artist
            } else if cellType == .tag {
                self.titleLabel.text = "Tag"
                if let tags = album?.album?.tags?.tag {
                    let tagString = (tags.map { ($0.name ?? "") }.joined(separator: ", ") + ".")
                    if !tags.isEmpty {
                        self.detailLabel.text = tagString
                    }
                }
            } else if cellType == .publish {
                self.titleLabel.text = "Publish"
                self.detailLabel.text = album?.album?.wiki?.published
            } else if cellType == .bio {
                self.titleLabel.text = "Summary"
                self.detailLabel.text = album?.album?.wiki?.summary
            } else if cellType == .content {
                self.titleLabel.text = "Content"
                self.detailLabel.text = album?.album?.wiki?.content
            }
            break
        case .track:
            if cellType == .name {
                self.titleLabel.text = "Name"
                self.detailLabel.text = track?.track?.name
            } else if cellType == .artist {
                self.titleLabel.text = "Artist"
                self.detailLabel.text = track?.track?.artist?.name
            } else if cellType == .tag {
                self.titleLabel.text = "Toptags"
                if let tags = track?.track?.toptags?.tag {
                    let tagString = (tags.map { ($0.name ?? "") }.joined(separator: ", ") + ".")
                    if !tags.isEmpty {
                        self.detailLabel.text = tagString
                    }
                }
            } else if cellType == .publish {
                self.titleLabel.text = "Publish"
                self.detailLabel.text = track?.track?.wiki?.published
            } else if cellType == .bio {
                self.titleLabel.text = "Summary"
                self.detailLabel.text = track?.track?.wiki?.summary
            } else if cellType == .content {
                self.titleLabel.text = "Content"
                self.detailLabel.text = track?.track?.wiki?.content
            }
            break
        case .artist:
            if cellType == .name {
                self.titleLabel.text = "Name"
                self.detailLabel.text = artist?.artist?.name
            }  else if cellType == .tag {
                self.titleLabel.text = "Toptags"
                if let tags = artist?.artist?.tags?.tag {
                    let tagString = (tags.map { ($0.name ?? "") }.joined(separator: ", ") + ".")
                    if !tags.isEmpty {
                        self.detailLabel.text = tagString
                    }
                }
            } else if cellType == .publish {
                self.titleLabel.text = "Publish"
                self.detailLabel.text = artist?.artist?.bio?.published
            } else if cellType == .bio {
                self.titleLabel.text = "Summary"
                self.detailLabel.text = artist?.artist?.bio?.summary
            } else if cellType == .content {
                self.titleLabel.text = "Content"
                self.detailLabel.text = artist?.artist?.bio?.content
            }
            break
        }
    }
    func setListData(type: SearchTerm, album: TrackAlbum?, artist: ArtistModel?, trackAlbum: AlbumTrack?) {
        if type == .album {
            self.titleLabel.text = album?.name
            self.detailLabel.text = album?.artist?.name
        } else if type == .artist {
            self.titleLabel.text = "Name"
            self.detailLabel.text =  artist?.name
        } else if type == .track {
            self.titleLabel.text = trackAlbum?.title
            self.detailLabel.text =  trackAlbum?.artist
        }
    }
    
}
