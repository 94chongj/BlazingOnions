//
//  BurgerCollectionViewCell.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/12/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class BurgerCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var cellView: UIView!
    @IBOutlet var burgerImageView: UIImageView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
