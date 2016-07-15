//
//  AddLocationCell.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

protocol AddLocationCellDelegate: class {
    func addLocationCell(addLocationCell: AddLocationCell, lat: Double, long: Double, name: String?)
}

/// An Add Location cell.
final class AddLocationCell: UITableViewCell {
    
    weak var delegate: AddLocationCellDelegate?
    
    @IBOutlet private weak var favoriteNameTextField: UITextField!
    @IBOutlet private weak var lattitudeTextField: UITextField!
    @IBOutlet private weak var longitudeTextField: UITextField!
    @IBOutlet private weak var saveFavoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction private func saveFavoriteButtonPressed(sender: AnyObject) {
        validateData()
    }
    
    private func validateData() {
        guard let latString = lattitudeTextField.text, longString = longitudeTextField.text else {
            return
        }
        
        guard let lat = Double(latString) where -90...90 ~= lat, let long = Double(longString) where -180...180 ~= long else {
            return
        }
        
        endEditing(true)

        delegate?.addLocationCell(self, lat: lat, long: long, name: favoriteNameTextField.text)
    }
    

    
}

//MARK: - Reusable
extension AddLocationCell: Reusable {
    
    static var nib: UINib? {
        return UINib(nibName: String(AddLocationCell.self), bundle: nil)
    }
}
