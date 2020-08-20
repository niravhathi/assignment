//
//  SearchViewController.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/19/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit
import KRProgressHUD
class SearchViewController: UITableViewController, UISearchResultsUpdating {
    
    var indicator:UIActivityIndicatorView?
    var searchViewModel: SearchViewModel = SearchViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = SearchTerm.allCases.map { $0.rawValue }
        searchController.searchBar.delegate = self
        self.tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchViewModel.getCount(searchTerm: SearchTerm.allCases[searchController.searchBar.selectedScopeButtonIndex])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        switch searchController.searchBar.selectedScopeButtonIndex {
        case 0:
            cell.bindAlbum(album: self.searchViewModel.albums?.results?.albummatches?.album?[indexPath.row])
        case 1:
            cell.bindTrack(track: self.searchViewModel.tracks?.results?.trackmatches?.track?[indexPath.row])
        case 2:
            cell.bindArtist(artist: self.searchViewModel.artists?.results?.artistmatches?.artist?[indexPath.row])
        default:
            break;
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if searchBar.text?.isEmpty ?? true {
            return
        }
        activityIndicator()
        indicator?.startAnimating()
        let index = searchBar.selectedScopeButtonIndex
        if index == 0 {            self.searchViewModel.fetchDataAlbums(searchText: searchBar.text ?? "") { (success) in
            if success {
                DispatchQueue.main.async {
                    self.indicator?.stopAnimating()
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.indicator?.stopAnimating()
                }
            }
            }
        } else if index == 1 {
            self.searchViewModel.fetchDataTracks(searchText: searchBar.text ?? "") { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.indicator?.stopAnimating()
                        self.tableView.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.indicator?.stopAnimating()
                    }
                }
            }
        } else {
            self.searchViewModel.fetchDataArtists(searchText: searchBar.text ?? "") { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.indicator?.stopAnimating()
                        self.tableView.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.indicator?.stopAnimating()
                    }
                }
            }
        }
    }
    
    func activityIndicator() {
        if(indicator == nil) {
            indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            indicator?.style = UIActivityIndicatorView.Style.medium
            indicator?.center =  CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
            indicator?.backgroundColor = .white
            indicator?.hidesWhenStopped = true
            keyWindow?.addSubview(indicator!)
        }
        
    }
}
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchBar.placeholder = "Search " + (searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] ?? "")
        self.title = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] ?? ""
        tableView.reloadData()
    }
}

