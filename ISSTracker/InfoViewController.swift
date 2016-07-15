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
        // make the request
        print("delegate pressed with \(lat), \(long), \(name)")
    }
}
