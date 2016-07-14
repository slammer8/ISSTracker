//
//  AddLocationCell.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

final class AddLocationCell: UITableViewCell {

    @IBOutlet private weak var favoriteNameTextField: UITextField!
    @IBOutlet private weak var lattitudeTextField: UITextField!
    @IBOutlet private weak var longitudeTextField: UITextField!
    @IBOutlet private weak var saveFavoriteButton: UIButton!
    
    @IBAction func saveFavoriteButtonPressed(sender: AnyObject) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
