//
//  InfoViewCellCreator.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

/// A cell creator for the InfoViewController.
final class InfoViewCellCreator {
    
    /// Delegate for the Add Location Cell
    var delegate: AddLocationCellDelegate?
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.estimatedRowHeight = 100
        tableView.registerReusableCell(AddLocationCell.self)
        tableView.registerReusableCell(SavedLocationCell.self)
        tableView.allowsSelection = false
    }
    
    func cell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, section: InfoViewControllerDataSource.Section) -> UITableViewCell {
        
        let cell: UITableViewCell

        switch section {
        case .AddLocation:
            let addLocationCell = tableView.dequeueReusableCell(indexPath: indexPath) as AddLocationCell
            
            addLocationCell.delegate = delegate
            
            cell = addLocationCell
            
        case let .SavedLocations(savedLocations: savedLocations):
            let savedLocationCell = tableView.dequeueReusableCell(indexPath: indexPath) as SavedLocationCell
            
            let savedLocation = savedLocations[indexPath.row]
                
            savedLocationCell.viewModel = SavedLocationCell.ViewModel(
                name: savedLocation.name,
                latitude: savedLocation.latitude.value,
                longitude: savedLocation.longitude.value,
                nextPass: savedLocation.passTimes.first?.riseTime
            )
            
            cell = savedLocationCell
            
        }
        
        return cell
    }
    
}

