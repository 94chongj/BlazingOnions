//
//  DrinksCollectionViewCell.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/11/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DrinksCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var drinkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
