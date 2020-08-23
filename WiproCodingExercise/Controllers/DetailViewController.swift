//
//  DetailViewController.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/23/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var type: SearchTerm?
    var detailViewModel: DetailViewModel =  DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

     self.tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        detailViewModel.fetchDetail(type: self.type ?? .album) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.type {
        case .album:
            return self.detailViewModel.getAlbumRows(for: section) 
        case .artist:
            return  self.detailViewModel.getArtistRows(for: section) 
        case .track:
            return self.detailViewModel.getTracksRows(for: section) 
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let iCell = self.tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            if self.type == .album {
                iCell.setImageData(type: .album, album: self.detailViewModel.albumDetail, track: nil, artist: nil)
            } else if self.type == .artist {
                iCell.setImageData(type: .artist, album: nil, track: nil, artist: self.detailViewModel.artistDetail)
            } else {
                iCell.setImageData(type: .artist, album: nil, track: self.detailViewModel.trackDetail, artist: nil)
            }
           return iCell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        switch self.type {
        case .album:
            return 5
        case .artist:
            return 5
        case .track:
            return 4
        case .none:
            return 0
        }
    }
}
