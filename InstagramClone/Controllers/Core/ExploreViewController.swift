//
//  ExploreViewController.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 29/04/22.
//

import UIKit

class ExploreViewController: UIViewController {

    private let searchController:UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .label
        
//        navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
        
    }
}
