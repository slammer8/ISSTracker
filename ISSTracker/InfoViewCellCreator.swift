//
//  InfoViewCellCreator.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

final class InfoViewCellCreator {
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.estimatedRowHeight = 100
        tableView.registerReusableCell(AddLocationCell.self)
        tableView.registerReusableCell(SavedLocationCell.self)
    }
    
    func cell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, sections: [InfoViewControllerDataSource.Section]) -> UITableViewCell {
        
        let cell: UITableViewCell

        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(indexPath: indexPath) as AddLocationCell
        case 1:
            cell = tableView.dequeueReusableCell(indexPath: indexPath) as SavedLocationCell
        default:
            print("this shoudln't happen")
            return UITableViewCell()
        }
        
        return cell
    }
    
}

