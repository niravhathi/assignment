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
        self.tableView.register(UINib(nibName: "DetailListTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailListTableViewCell")
        detailViewModel.fetchDetail(type: self.type ?? .album) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
         self.navigationController?.navigationBar.prefersLargeTitles = false
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        return self.detailViewModel.getCell(forTableView: tableView, withIndexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.detailViewModel.getHeight(forTableView: tableView, withIndexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            switch self.type {
            case .artist:
                return "Similar"
            case .album:
                return "Tracks"
            case .track:
                return "Album"
            case .none:
                return ""
            }
        } else if section == 4 {
           switch self.type {
            case .artist:
                return "Bio"
            case .album:
                return "Wiki"
            case .track:
                return "Wiki"
            case .none:
                return ""
            }
        }
        return  ""
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1  {
            return 0
        }
        return 22
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}
