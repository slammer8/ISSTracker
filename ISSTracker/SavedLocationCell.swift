//
//  SavedLocationCell.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

final class SavedLocationCell: UITableViewCell {

    @IBOutlet private weak var favoriteNameStackView: UIStackView!
    @IBOutlet private weak var favoriteNameLabel: UILabel!
    @IBOutlet private weak var nextPassTimeLabel: UILabel!
    @IBOutlet private weak var coordinatesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
