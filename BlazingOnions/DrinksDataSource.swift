//
//  drinksDataSource.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/10/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    var images: [UIImage] = [#imageLiteral(resourceName: "Drink_option_1"),#imageLiteral(resourceName: "Drink_option_2"),#imageLiteral(resourceName: "Drink_option_3"),#imageLiteral(resourceName: "Drink_option_4"),#imageLiteral(resourceName: "Drink_option_5"),#imageLiteral(resourceName: "Drink_option_6"),#imageLiteral(resourceName: "Drink_option_7"),#imageLiteral(resourceName: "Drink_option_8"),#imageLiteral(resourceName: "Drink_option_9")]

    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        print("Hello Add Button")
        print(sender.tag)
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        print("Hello Minus Button")
        print(sender.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(images.count)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! drinkCell
        cell.imageView.image = images[indexPath.row]
        
        let addButton = UIButton(frame: CGRect(x: 27.5, y: 190, width: 50, height: 50))
        addButton.backgroundColor = .red
        addButton.addTarget(self, action: #selector(addButtonTapped), for: UIControlEvents.touchUpInside)
        addButton.tag = indexPath.row
        addButton.isUserInteractionEnabled = true
        let minusButton = UIButton(frame: CGRect(x: 172.5, y: 190, width: 50, height: 50))
        minusButton.backgroundColor = .red
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: UIControlEvents.touchUpInside)
        minusButton.tag = indexPath.row
        minusButton.isUserInteractionEnabled = true
        
        cell.addSubview(addButton)
        cell.addSubview(minusButton)
        
        minusButton.alpha = 0.7
        
        cell.btnTapAction = {
            () in
            print("Edit tapped in cell", indexPath)
        }
        return cell
    }
    
    
}
