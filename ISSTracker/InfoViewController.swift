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
    private var cellCreator: InfoViewCellCreator?
    private let updater = FavoriteLocationUpdater()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        cellCreator = InfoViewCellCreator(tableView: tableView)
        cellCreator?.delegate = self
        guard let cellCreator = cellCreator else {
            assertionFailure("Cell creator not set up properly")
            return
        }
        
        dataSource = InfoViewControllerDataSource(tableView: tableView, cellCreator: cellCreator)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

}

// MARK: - AddLocationCellDelegate

extension InfoViewController: AddLocationCellDelegate {
    func addLocationCell(addLocationCell: AddLocationCell, lat: Double, long: Double, name: String?) {
        
        let location = CLLocationCoordinate2DMake(lat, long)
        
        let favoriteRequest = ISSRequest.LocationPassTime(location: location)
        
        updater.requestSavedLocation(favoriteRequest) { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case let .Success(result: result):
                print(result.passTimes)
            case .Failure:
                print("error making request")
            }
            
        }

    }
}
