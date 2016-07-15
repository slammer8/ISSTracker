//
//  InfoViewControllerDataSource.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

final class InfoViewControllerDataSource: NSObject {
    
    /// Describing the possible sections in the table view.
    enum Section {
        
        /// The add location section.
        case AddLocation
        
        /// The saved locations section.
        case SavedLocations(savedLocations: [SavedLocation])
        
        /// The number of rows that should be displayed.
        var numberOfRows: Int {
            switch self {
            case .AddLocation:
                // Only 1 add location cell should exist.
                return 1
            case let .SavedLocations(savedLocations):
                return savedLocations.count
            }
        }
        
        /// The title for section.
        var titleForSection: String {
            switch self {
            case .AddLocation:
                return NSLocalizedString("Add A Location", comment: "Add a Location")
            case .SavedLocations:
                return NSLocalizedString("Saved Locations", comment: "Saved Locations")
            }
        }
        
        /// If the cells within the section can be edited.
        var canEdit: Bool {
            switch self {
            case .AddLocation:
                return false
            case .SavedLocations:
                return true
            }
        }
    }
    
    private var sections: [Section] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView
    private let cellCreator: InfoViewCellCreator
    
    /**
     Initializes a InfoViewControllerDataSource
     
     - parameter tableView: The tableView associated with the data source.
     
     - returns: An initialized InfoViewControllerDataSource.
     */
    init(tableView: UITableView, cellCreator: InfoViewCellCreator) {
        self.tableView = tableView
        self.cellCreator = cellCreator
        self.sections = InfoViewControllerDataSource.createSections()
    }
    
    private static func createSections() -> [Section] {
        //TODO: fix
        return [Section.AddLocation, Section.SavedLocations(savedLocations: [])]
    }

}

extension InfoViewControllerDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].canEdit
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].titleForSection
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellCreator.cell(tableView, cellForRowAtIndexPath: indexPath, sections: sections)
    }
}
