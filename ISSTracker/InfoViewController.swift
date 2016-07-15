//
//  InfoViewController.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit
import CoreLocation

/// Displays saved locations and an option to save a new location.
final class InfoViewController: UITableViewController {

    private var dataSource: InfoViewControllerDataSource?
    private lazy var cellCreator: InfoViewCellCreator = InfoViewCellCreator(tableView: self.tableView)
    private let updater = FavoriteLocationUpdater()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        title = NSLocalizedString("Favorites", comment: "Saved Favorites")
        
        cellCreator.delegate = self
        dataSource = InfoViewControllerDataSource(tableView: tableView, cellCreator: cellCreator)
        
        dataSource?.updateSections()
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    private func performLocationRequest(lat: Double, long: Double, name: String?) {
        let location = CLLocationCoordinate2DMake(lat, long)
        
        let favoriteRequest = ISSRequest.LocationPassTime(location: location)
        
        updater.requestSavedLocation(favoriteRequest, name: name) { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case let .Success(result: result):
                
                if let name = name where !name.isEmpty {
                    result.name = name
                }
                
                strongSelf.persistenceController.persistObject(result)
                strongSelf.dataSource?.updateSections()
            case let .Failure(error: error):
                print("error \(error)")
            }
        }
    }

}

// MARK: - AddLocationCellDelegate

extension InfoViewController: AddLocationCellDelegate {
    func addLocationCell(addLocationCell: AddLocationCell, lat: Double, long: Double, name: String?) {
        
        performLocationRequest(lat, long: long, name: name)
    }
}
