//
//  drinkCellCollectionViewCell.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/10/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class drinkCell: UICollectionViewCell {

    var imageView: UIImageView!
    var btnTapAction: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(imageView)
        
        //drinkButton = UIButton(frame: CGRect(x: 0, y: imageView.frame.size.height, width: frame.size.width, height: frame.size.height/3))
        //contentView.addSubview(drinkButton)
        //setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*let addButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Add", for: .normal)
        return button
    }()
    
    /*let minusButton: UIButton {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Minus", for: .normal)
        return button
    }()
    */
    func setupViews() {
        addSubview(addButton)
        //addSubview(minusButton)
        
        addButton.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor).isActive = true
        addButton.leftAnchor.constraint(equalTo: self.imageView.leftAnchor, constant: 10).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant:-20).isActive = true
        
        addButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }
    
    @objc func btnTapped() {
        print("Tapped!")
        
        btnTapAction?()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }*/
}
