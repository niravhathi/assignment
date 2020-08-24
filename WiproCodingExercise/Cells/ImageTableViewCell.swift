//
//  ImageTableViewCell.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/23/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var backdrop: ImageLoader!
    @IBOutlet weak var poster: ImageLoader!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImageData(type: SearchTerm, album: AlbumDetails?, track: TrackDetails?, artist: ArtistDetails?) {
        switch type {
        case .album:
            if let strUrl = album?.album?.image?[3].textString {
                if let imgUrl = URL(string: strUrl) {
                    backdrop.loadImageWithUrl(imgUrl)
                }
            }
            self.titleLabel.text = album?.album?.name
            break
        case .track:
            if let strUrl = track?.track?.album?.image?[3].textString {
                if let imgUrl = URL(string: strUrl) {
                    backdrop.loadImageWithUrl(imgUrl)
                }
            }
            self.titleLabel.text = track?.track?.name
            break
        case .artist:
            if let strUrl = artist?.artist?.image?[3].textString {
                if let imgUrl = URL(string: strUrl) {
                    backdrop.loadImageWithUrl(imgUrl)
                }
            }
            self.titleLabel.text = artist?.artist?.name
            break
        }
    }
}
