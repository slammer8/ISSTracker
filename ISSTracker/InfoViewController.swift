//
//  InfoViewController.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit
import CoreLocation

final class InfoViewController: UITableViewController {

    private var dataSource: InfoViewControllerDataSource?
    private var cellCreator: InfoViewCellCreator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        cellCreator = InfoViewCellCreator(tableView: tableView)
        
        guard let cellCreator = cellCreator else {
            assertionFailure("Cell creator not set up properly")
            return
        }
        
        dataSource = InfoViewControllerDataSource(tableView: tableView, cellCreator: cellCreator)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

}
