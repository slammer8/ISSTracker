//
//  SavedLocationCell.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/14/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit

/// A saved location cell.
final class SavedLocationCell: UITableViewCell {
    
    /// Date format of the cell (September 15, 2016 3:45:25 pm PST)
    static let DateFormat = "MMMM dd yyyy h:mm:ss a zzz"

    /// A view model to configure the cell
    struct ViewModel {
        var name: String?
        let latitude: Double?
        let longitude: Double?
        let nextPass: NSDate?
    }
    
    /// When this is set, the view will be configured.
    var viewModel: ViewModel? {
        didSet{
            setUpCell()
        }
    }
    
    @IBOutlet private weak var favoriteNameStackView: UIStackView!
    @IBOutlet private weak var favoriteNameLabel: UILabel!
    @IBOutlet private weak var nextPassTimeLabel: UILabel!
    @IBOutlet private weak var coordinatesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK:- Private functions
    
    private func setUpCell() {
        
        if let name = viewModel?.name where !name.isEmpty {
            favoriteNameLabel.text = name
            favoriteNameStackView.hidden = false
        } else {
            favoriteNameStackView.hidden = true
        }
        
        nextPassTimeLabel.text = viewModel?.nextPass?.convertToLocaleUsingDateFormat(self.dynamicType.DateFormat) ?? ""
        
        if let lat = viewModel?.latitude, long = viewModel?.longitude {
            coordinatesLabel.text = "\(lat), \(long)"
        } else {
            coordinatesLabel.text = ""
        }
    }
}

//MARK: - Reusable
extension SavedLocationCell: Reusable {
    static var nib: UINib? {
        return UINib(nibName: String(SavedLocationCell.self), bundle: nil)
    }
}
