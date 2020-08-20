//
//  ListTableViewCell.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: ImageLoader!{
      didSet {
        imageViewCell.clipsToBounds = true
        imageViewCell.layer.cornerCurve = .continuous
        imageViewCell.layer.cornerRadius = 7
      }
    }
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindAlbum(album: Album?) {
        self.labelTitle.text = album?.name
        self.labelSubTitle.text = album?.artist
        if let strUrl = album?.image?[2].text {
            if let imgUrl = URL(string: strUrl) {
                imageViewCell.loadImageWithUrl(imgUrl)
            }
        }
    }
    
    func bindTrack(track: Track?) {
        self.labelTitle.text = track?.name
        self.labelSubTitle.text = track?.artist
        if let strUrl = track?.image?[2].text {
            if let imgUrl = URL(string: strUrl) {
                 imageViewCell.loadImageWithUrl(imgUrl)
            }
            
        }
    }
    
    func bindArtist(artist: Artist?) {
        self.labelTitle.text = artist?.name
        self.labelSubTitle.text = "Listeners: " + (artist?.listeners ?? "")
        if let strUrl = artist?.image?[2].text {
           if let imgUrl = URL(string: strUrl) {
                imageViewCell.loadImageWithUrl(imgUrl)
            }
        }
    }
}
