//
//  FoodViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var gourmetImage: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    @IBOutlet weak var appetizersButton: UIButton!
    @IBOutlet weak var sandwhichButton: UIButton!
    @IBOutlet weak var soupButton: UIButton!
    @IBOutlet weak var entreeButton: UIButton!
    @IBOutlet weak var blazersButton: UIButton!
    @IBOutlet var servingSoonView: UIView!
    
    var isButtonActive: Bool = false
    var images: [UIImage] = [#imageLiteral(resourceName: "Burger_option_9"),#imageLiteral(resourceName: "Burger_option_1"),#imageLiteral(resourceName: "Burger_option_2"),#imageLiteral(resourceName: "Burger_option_3"),#imageLiteral(resourceName: "Burger_option_4"),#imageLiteral(resourceName: "Burger_option_5"),#imageLiteral(resourceName: "Burger_option_6"),#imageLiteral(resourceName: "Burger_option_7"),#imageLiteral(resourceName: "Burger_option_8"),#imageLiteral(resourceName: "Burger_option_9"),#imageLiteral(resourceName: "Burger_option_1"),#imageLiteral(resourceName: "Burger_option_2"),#imageLiteral(resourceName: "Burger_option_3"),#imageLiteral(resourceName: "Burger_option_4"),#imageLiteral(resourceName: "Burger_option_5"),#imageLiteral(resourceName: "Burger_option_6"),#imageLiteral(resourceName: "Burger_option_7"),#imageLiteral(resourceName: "Burger_option_8")]
    var numCount: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var breadImages: [UIImage] = [#imageLiteral(resourceName: "kaiser"),#imageLiteral(resourceName: "Sesame_seed"),#imageLiteral(resourceName: "Chiabata")]
    var breadText: [String] = ["Kaiser", "Sesame Seed", "Chiabatta"]
    
    @IBOutlet var burgerCollectionView: UICollectionView!
    @IBOutlet var foodTopLabel: UILabel!
    
    // MARK: Currently working on buildBurgerCollectionView
    @IBOutlet var buildBurgerCollectionView: UICollectionView!
    
    
    //~~~~~~~~~~~~~~~~~~~~
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let cell = burgerCollectionView.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! BurgerCollectionViewCell
        UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 0}, completion: nil)
        numCount[sender.tag] = numCount[sender.tag] + 1
        cell.countLabel.text = String(numCount[sender.tag])
        UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 1}, completion: nil)
        
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        //1 to 0 transition is not smooth on button
        let cell = burgerCollectionView.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! BurgerCollectionViewCell
        if numCount[sender.tag] == 0 {
            numCount[sender.tag] = 0
            cell.countLabel.text = String(numCount[sender.tag])
        }
        else {
            UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 0}, completion: nil)
            numCount[sender.tag] = numCount[sender.tag] - 1
            cell.countLabel.text = String(numCount[sender.tag])
            UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 1}, completion: nil)
            if numCount[sender.tag] == 0 {
                UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 0}, completion: nil)
            }
            if numCount[sender.tag] != 0 {
                UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 1}, completion: nil)
            }
        }
    }
    
    // MARK: Major Buttons
    
    @IBAction func toHomeButton(_ sender: UIButton) {
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDrinksPage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func dessertButtonPressed(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Dessert_icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDessertPage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    @IBAction func totalButton(_ sender: UIButton) {
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toTotalPage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    @IBAction func appetizersButtonPressed(_ sender: UIButton) {
        appetizersButton.setImage(#imageLiteral(resourceName: "fries_icon-active"), for: UIControlState.normal)
        appetizersButton.imageView?.contentMode = .scaleAspectFit
        appetizersButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 0)
        servingSoonView.isHidden = false
        burgerCollectionView.isHidden = true
        foodTopLabel.isHidden = true
    }
    
    @IBAction func gourmetButtonPressed(_ sender: UIButton) {
        gourmetImage.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        gourmetImage.imageView?.contentMode = .scaleAspectFit
        gourmetImage.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 1)
        servingSoonView.isHidden = true
        burgerCollectionView.isHidden = false
        foodTopLabel.isHidden = false
    }
    
    @IBAction func sandwhichButtonPressed(_ sender: UIButton) {
        sandwhichButton.setImage(#imageLiteral(resourceName: "sandwhich_-active"), for: UIControlState.normal)
        sandwhichButton.imageView?.contentMode = .scaleAspectFit
        sandwhichButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 2)
        servingSoonView.isHidden = false
        burgerCollectionView.isHidden = true
        foodTopLabel.isHidden = true
    }
    
    @IBAction func soupButtonPressed(_ sender: UIButton) {
        soupButton.setImage(#imageLiteral(resourceName: "soup_icon-active"), for: UIControlState.normal)
        soupButton.imageView?.contentMode = .scaleAspectFit
        soupButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 3)
        servingSoonView.isHidden = false
        burgerCollectionView.isHidden = true
        foodTopLabel.isHidden = true
    }
    
    
    @IBAction func entreeButtonPressed(_ sender: UIButton) {
        entreeButton.setImage(#imageLiteral(resourceName: "fish_icon-active"), for: UIControlState.normal)
        entreeButton.imageView?.contentMode = .scaleAspectFit
        entreeButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 4)
        servingSoonView.isHidden = false
        burgerCollectionView.isHidden = true
        foodTopLabel.isHidden = true
    }
    
    @IBAction func blazersButtonPressed(_ sender: UIButton) {
        blazersButton.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        blazersButton.imageView?.contentMode = .scaleAspectFit
        blazersButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 5)
        servingSoonView.isHidden = false
        burgerCollectionView.isHidden = true
        foodTopLabel.isHidden = true
    }
    
    // MARK: collectionView Layout, etc functions, and viewdidLoad/Appear
    
    func returnInactiveIcons(buttonID: Int) {
        var iconsArray: [UIButton] = [appetizersButton, gourmetImage, sandwhichButton, soupButton, entreeButton, blazersButton]
        iconsArray.remove(at: buttonID)
        var itemIcon : UIImage
        for button in 0 ..< iconsArray.count {
            if iconsArray[button] == appetizersButton{
                itemIcon = #imageLiteral(resourceName: "fries_icon-inactive")
                
            }
            else if iconsArray[button] == gourmetImage {
                itemIcon = #imageLiteral(resourceName: "Burger_-inactive")
                
            }
            else if iconsArray[button] == sandwhichButton {
                itemIcon = #imageLiteral(resourceName: "sandwhich_-inactive")
                
            }
            else if iconsArray[button] == soupButton {
                itemIcon = #imageLiteral(resourceName: "soup_icon-inactive")
                
            }
            else if iconsArray[button] == entreeButton {
                itemIcon = #imageLiteral(resourceName: "fish_icon-inactive")
                
            }
            else {
                itemIcon = #imageLiteral(resourceName: "Burger_-inactive")
            }
            iconsArray[button].setImage(itemIcon, for: UIControlState.normal)
            iconsArray[button].imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == burgerCollectionView {
            return CGSize(width: 213, height: 205)
        }
        else {
            return CGSize(width: 120, height: 149)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        foodButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        gourmetImage.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        gourmetImage.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        servingSoonView.isHidden = true
        
        //registering and setting datasource/delegate for burgerCollectionView/Cell
        burgerCollectionView.register(UINib(nibName: "BurgerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BurgerCollectionViewCell")
        burgerCollectionView.dataSource = self
            //requires setting collectionView.delegate to self in order for extension to work
        self.burgerCollectionView.delegate = self
        if let layout = burgerCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 26 //in between columns
            layout.minimumInteritemSpacing = 12 //in between rows
            //sectionInset lets me modify the distance from the outer edge of the collectionview to the cell from all 4 directions
            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 26)
        if let layout = buildBurgerCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsetsMake(10, 18, 0, 18)
            }
            burgerCollectionView.reloadData()
        }
        
        //registering and setting datasource/delegate for buildBurgerCollectionView/Cell
        buildBurgerCollectionView.register(UINib(nibName: "buildBurgerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buildBurgerCollectionViewCell")
        buildBurgerCollectionView.dataSource = self
        buildBurgerCollectionView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        burgerCollectionView.reloadData()
    }

    
    // MARK: Extensions(UICollectionViewDataSource)
    
}

extension FoodViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //use if statement to check which uiCollectionView is being passed through
        if collectionView == burgerCollectionView {
            return images.count
        }
        else {
            return breadImages.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == burgerCollectionView {
            //first Burger Collection View showing all burgers
            let cell: BurgerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BurgerCollectionViewCell", for: indexPath) as! BurgerCollectionViewCell
            cell.cellView.layer.cornerRadius = 20
            cell.burgerImageView.image = images[indexPath.row]
            cell.addButton.tag = indexPath.row
            cell.addButton.addTarget(self, action: #selector(addButtonTapped), for: UIControlEvents.touchUpInside)
            cell.addButton.backgroundColor = .clear
            cell.addButton.layer.cornerRadius = 20
            cell.minusButton.tag = indexPath.row
            cell.minusButton.addTarget(self, action: #selector(minusButtonTapped), for: UIControlEvents.touchUpInside)
            cell.minusButton.backgroundColor = .clear
            cell.countLabel.tag = indexPath.row
            cell.countLabel.layer.cornerRadius = 11
            //Button is not fully visible because colors?
            cell.countLabel.clipsToBounds = true
            cell.countLabel.text = String(numCount[indexPath.row])
            cell.countLabel.alpha = 0.0
            if cell.countLabel.text != "0" {
                cell.countLabel.alpha = 1
            }
            else {
                cell.countLabel.alpha = 0.0
            }
            return cell
        }
        else {
            //second Burger Collection View showing build a burger pages
            let cell: buildBurgerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "buildBurgerCollectionViewCell", for: indexPath) as! buildBurgerCollectionViewCell
            //ADD STUFF HERE
            cell.buildBurgerImageView.image = breadImages[indexPath.row]
            //cell.buildBurgerImageView.layer.cornerRadius = 20
            cell.buildBurgerLabel.text = String(breadText[indexPath.row])
            return cell
        }
    }
}

