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
    @IBOutlet var chooseBunLabel: UILabel!
    @IBOutlet var customizeView: UIView!
    @IBOutlet var bottomDescriptionLabel: UILabel!
    
    @IBOutlet var questionImage: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var leftStackView: UIView!
    @IBOutlet var rightStackView: UIView!
    
    var isButtonActive: Bool = false
    var images: [UIImage] = [#imageLiteral(resourceName: "Burger_option_9"),#imageLiteral(resourceName: "Burger_option_1"),#imageLiteral(resourceName: "Burger_option_2"),#imageLiteral(resourceName: "Burger_option_3"),#imageLiteral(resourceName: "Burger_option_4"),#imageLiteral(resourceName: "Burger_option_5"),#imageLiteral(resourceName: "Burger_option_6"),#imageLiteral(resourceName: "Burger_option_7"),#imageLiteral(resourceName: "Burger_option_8"),#imageLiteral(resourceName: "Burger_option_9"),#imageLiteral(resourceName: "Burger_option_1"),#imageLiteral(resourceName: "Burger_option_2"),#imageLiteral(resourceName: "Burger_option_3"),#imageLiteral(resourceName: "Burger_option_4"),#imageLiteral(resourceName: "Burger_option_5"),#imageLiteral(resourceName: "Burger_option_6"),#imageLiteral(resourceName: "Burger_option_7"),#imageLiteral(resourceName: "Burger_option_8")]
    var numCount: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var breadButtonImageArray: [UIButton] = []
    var meatButtonImageArray: [UIButton] = []
    var cheeseButtonImageArray: [UIButton] = []
    var toppingButtonImageArray: [UIButton] = []
    var condimentButtonImageArray: [UIButton] = []
    var sidesButtonImageArray: [UIButton] = []
    
    
    let breadImages: [UIImage] = [#imageLiteral(resourceName: "kaiser"),#imageLiteral(resourceName: "Sesame_seed"),#imageLiteral(resourceName: "Chiabata")]
    let breadText: [String] = ["Kaiser", "Sesame Seed", "Chiabatta"]
    
    let meatImages: [UIImage] = [#imageLiteral(resourceName: "beef"),#imageLiteral(resourceName: "turkey"),#imageLiteral(resourceName: "chicken"),#imageLiteral(resourceName: "buffalo"),#imageLiteral(resourceName: "lamb")]
    let meatText: [String] = ["100% Beef", "Turkey (+ $2.49)", "Chicken (+ $0.49)", "Buffalo", "Lamb"]
    
    let cheeseImages: [UIImage] = [#imageLiteral(resourceName: "American"),#imageLiteral(resourceName: "Pepperjack")]
    let cheeseText: [String] = ["Pepperjack", "American"]
    
    let toppingImages: [UIImage] = [#imageLiteral(resourceName: "Onions"),#imageLiteral(resourceName: "Bacon"),#imageLiteral(resourceName: "tomatoes")]
    let toppingText: [String] = ["Onions", "Bacon", "Tomatoes"]
    
    let condimentImages: [UIImage] = [#imageLiteral(resourceName: "Garlic_Mayo"),#imageLiteral(resourceName: "chipotle")]
    let condimentText: [String] = ["Garlic Mayo", "Chipotle"]
    
    let sidesImages: [UIImage] = [#imageLiteral(resourceName: "Fries"),#imageLiteral(resourceName: "Rings")]
    let sidesText: [String] = ["Fries", "Onion Rings"]
    
    let darkGreyColor: UIColor = UIColor(red: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    
    @IBOutlet var burgerCollectionView: UICollectionView!
    @IBOutlet var foodTopLabel: UILabel!
    
    // MARK: Currently working on buildBurgerCollectionView
    @IBOutlet var buildBurgerCollectionView: UICollectionView!
    
    var currentBuildPage: String = ""
    var bunCount: [Int] = [0,0,0]
    var meatCount: [Int] = [0,0,0,0,0]
    var cheeseCount: [Int] = [0,0]
    var toppingCount: [Int] = [0,0,0]
    var condimentCount: [Int] = [0,0]
    var sidesCount: [Int] = [0,0]
    
    //~~~~~~~~~~~~~~~~~~~~
    @IBAction func buildBurgerButtonOverlayTapped(_ sender: UIButton) {
        let cell = buildBurgerCollectionView.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! buildBurgerCollectionViewCell
        //sets image to next regular, then large, then xl, then xxl
        //~~~~~ code here
        if currentBuildPage == "ChooseBun" {
            for i in 0...2 {
                let cell = buildBurgerCollectionView.cellForItem(at: IndexPath(row: i, section: 0)) as! buildBurgerCollectionViewCell
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            bunCount = [0,0,0]
            if sender.tag == 0 {
                if bunCount[sender.tag] == 0 {
                    if cell.buildBurgerCustomTypeImageView.image == nil {
                        cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "checkmark")
                        bunCount[sender.tag] = 1
                    }
                }
                else {
                    bunCount[sender.tag] = 0
                }
            }
            else if sender.tag == 1 {
                if bunCount[sender.tag] == 0 {
                    if cell.buildBurgerCustomTypeImageView.image == nil {
                        cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "checkmark")
                        bunCount[sender.tag] = 1
                    }
                }
                else {
                    bunCount[sender.tag] = 0
                }
            }
            else {
                if bunCount[sender.tag] == 0 {
                    if cell.buildBurgerCustomTypeImageView.image == nil {
                        cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "checkmark")
                        bunCount[sender.tag] = 1
                    }
                }
                else {
                    bunCount[sender.tag] = 0
                }
            }
        }
        else if currentBuildPage == "Meat" {
            if meatCount[sender.tag] == 4 {
                meatCount[sender.tag] = 0
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            else if meatCount[sender.tag] == 0 {
                meatCount[sender.tag] = meatCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
            }
            else if meatCount[sender.tag] == 1 {
                meatCount[sender.tag] = meatCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XL")
            }
            else if meatCount[sender.tag] == 2 {
                meatCount[sender.tag] = meatCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XXL")
            }
            else if meatCount[sender.tag] == 3 {
                meatCount[sender.tag] = meatCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XXXL")
            }
        }
            
        else if currentBuildPage == "Cheese" {
            if cheeseCount[sender.tag] == 2 {
                cheeseCount[sender.tag] = 0
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            else if cheeseCount[sender.tag] == 0 {
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                cheeseCount[sender.tag] = cheeseCount[sender.tag] + 1
            }
            else if cheeseCount[sender.tag] == 1 {
                cheeseCount[sender.tag] = cheeseCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
            }
        }
        else if currentBuildPage == "Topping" {
            if toppingCount[sender.tag] == 2 {
                toppingCount[sender.tag] = 0
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            else if toppingCount[sender.tag] == 0 {
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                toppingCount[sender.tag] = toppingCount[sender.tag] + 1
            }
            else if toppingCount[sender.tag] == 1 {
                toppingCount[sender.tag] = toppingCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
            }
        }
        else if currentBuildPage == "Condiment" {
            if condimentCount[sender.tag] == 2 {
                condimentCount[sender.tag] = 0
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            else if condimentCount[sender.tag] == 0 {
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                condimentCount[sender.tag] = condimentCount[sender.tag] + 1
            }
            else if condimentCount[sender.tag] == 1 {
                condimentCount[sender.tag] = condimentCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
            }
        }
        else if currentBuildPage == "Sides" {
            if sidesCount[sender.tag] == 2 {
                sidesCount[sender.tag] = 0
                cell.buildBurgerCustomTypeImageView.image = nil
            }
            else if sidesCount[sender.tag] == 0 {
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                sidesCount[sender.tag] = sidesCount[sender.tag] + 1
            }
            else if sidesCount[sender.tag] == 1 {
                sidesCount[sender.tag] = sidesCount[sender.tag] + 1
                cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
            }
         }
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let cell = burgerCollectionView.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! BurgerCollectionViewCell
        UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 0}, completion: nil)
        numCount[sender.tag] = numCount[sender.tag] + 1
        cell.countLabel.text = String(numCount[sender.tag])
        UILabel.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {cell.countLabel.alpha = 1}, completion: nil)
        //views that are not hidden anymore
        customizeView.isHidden = false
        
        //views that need to be hidden
        burgerCollectionView.isHidden = true
        cancelButton.isHidden = true
        nextButton.isHidden = true
        yesButton.isHidden = false
        noButton.isHidden = false
        bottomDescriptionLabel.isHidden = true
        chooseBunLabel.isHidden = true
        questionImage.isHidden = false
        currentBuildPage = "ChooseBun"
        buildBurgerCollectionView.isHidden = true
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
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        if currentBuildPage == "Sides" {
            currentBuildPage = "Condiment"
        }
        else if currentBuildPage == "Condiment" {
            currentBuildPage = "Topping"
        }
        else if currentBuildPage == "Topping" {
            currentBuildPage = "Cheese"
        }
        else if currentBuildPage == "Cheese" {
            currentBuildPage = "Meat"
        }
        else if currentBuildPage == "Meat" {
            currentBuildPage = "ChooseBun"
            nextButton.setTitle("ORDER", for: UIControlState.normal)
        }
        else if currentBuildPage == "ChooseBun" {
            currentBuildPage = ""
            buildBurgerCollectionView.isHidden = true
            questionImage.isHidden = false
            yesButton.isHidden = false
            noButton.isHidden = false
            chooseBunLabel.isHidden = true
            nextButton.isHidden = true
            cancelButton.isHidden = true
            bottomDescriptionLabel.isHidden = true
        }
        buildBurgerCollectionView.reloadData()
        print(currentBuildPage)
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        customizeView.isHidden = true
        burgerCollectionView.isHidden = false
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if currentBuildPage == "ChooseBun" {
            currentBuildPage = "Meat"
        }
        else if currentBuildPage == "Meat" {
            currentBuildPage = "Cheese"
        }
        else if currentBuildPage == "Cheese" {
            currentBuildPage = "Topping"
        }
        else if currentBuildPage == "Topping" {
            currentBuildPage = "Condiment"
        }
        else if currentBuildPage == "Condiment" {
            currentBuildPage = "Sides"
            nextButton.setTitle("ORDER", for: UIControlState.normal)
        }
        else if currentBuildPage == "Sides" {
            currentBuildPage = ""
            customizeView.isHidden = true
            burgerCollectionView.isHidden = false
        }
        buildBurgerCollectionView.reloadData()
        print(currentBuildPage)
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        questionImage.isHidden = true
        noButton.isHidden = true
        yesButton.isHidden = true
        cancelButton.isHidden = false
        nextButton.isHidden = false
        bottomDescriptionLabel.isHidden = false
        chooseBunLabel.isHidden = false
        buildBurgerCollectionView.isHidden = false
        //might have to do something about currentBuildPage
        currentBuildPage = "ChooseBun"
        buildBurgerCollectionView.reloadData()
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
        bottomDescriptionLabel.layer.borderWidth = 3
        bottomDescriptionLabel.layer.borderColor = darkGreyColor.cgColor
        leftStackView.layer.borderWidth = 3
        leftStackView.layer.borderColor = darkGreyColor.cgColor
        rightStackView.layer.borderWidth = 3
        rightStackView.layer.borderColor = darkGreyColor.cgColor
        
        //registering and setting datasource/delegate for buildBurgerCollectionView/Cell
        buildBurgerCollectionView.register(UINib(nibName: "buildBurgerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buildBurgerCollectionViewCell")
        buildBurgerCollectionView.dataSource = self
        buildBurgerCollectionView.delegate = self
        buildBurgerCollectionView.isHidden = true
        customizeView.isHidden = true
        
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
            if currentBuildPage == "ChooseBun" {
                return breadImages.count
            }
            else if currentBuildPage == "Meat" {
                return meatImages.count
            }
            else if currentBuildPage == "Cheese" {
                return cheeseImages.count
            }
            else if currentBuildPage == "Topping" {
                return toppingImages.count
            }
            else if currentBuildPage == "Condiment" {
                return condimentImages.count
            }
            else {
                return sidesImages.count
            }
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
            cell.buildBurgerButtonOverlay.tag = indexPath.row
            cell.buildBurgerButtonOverlay.addTarget(self, action: #selector(buildBurgerButtonOverlayTapped), for: UIControlEvents.touchUpInside)
            cell.buildBurgerCustomTypeImageView.backgroundColor = .clear
            cell.buildBurgerCustomTypeImageView.layer.cornerRadius = 20
            //ADD STUFF HERE
            if currentBuildPage == "ChooseBun" {
                cell.buildBurgerImageView.image = breadImages[indexPath.row]
                cell.buildBurgerLabel.text = String(breadText[indexPath.row])
                if bunCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "checkmark")
                }
                else {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
            }
            else if currentBuildPage == "Meat" {
                cell.buildBurgerImageView.image = meatImages[indexPath.row]
                cell.buildBurgerLabel.text = String(meatText[indexPath.row])
                if meatCount[indexPath.row] == 0 {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
                else if meatCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                }
                else if meatCount[indexPath.row] == 2 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XL")
                }
                else if meatCount[indexPath.row] == 3 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XXL")
                }
                else if meatCount[indexPath.row] == 4 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "XXXL")
                }
            }
            else if currentBuildPage == "Cheese" {
                cell.buildBurgerImageView.image = cheeseImages[indexPath.row]
                cell.buildBurgerLabel.text = String(cheeseText[indexPath.row])
                if cheeseCount[indexPath.row] == 0 {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
                else if cheeseCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                }
                else if cheeseCount[indexPath.row] == 2 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
                }
            }
            else if currentBuildPage == "Topping" {
                cell.buildBurgerImageView.image = toppingImages[indexPath.row]
                cell.buildBurgerLabel.text = String(toppingText[indexPath.row])
                if toppingCount[indexPath.row] == 0 {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
                else if toppingCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                }
                else if toppingCount[indexPath.row] == 2 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
                }
            }
            else if currentBuildPage == "Condiment" {
                cell.buildBurgerImageView.image = condimentImages[indexPath.row]
                cell.buildBurgerLabel.text = String(condimentText[indexPath.row])
                if condimentCount[indexPath.row] == 0 {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
                else if condimentCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                }
                else if condimentCount[indexPath.row] == 2 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
                }
            }
            else if currentBuildPage == "Sides" {
                cell.buildBurgerImageView.image = sidesImages[indexPath.row]
                cell.buildBurgerLabel.text = String(sidesText[indexPath.row])
                if sidesCount[indexPath.row] == 0 {
                    cell.buildBurgerCustomTypeImageView.image = nil
                }
                else if sidesCount[indexPath.row] == 1 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "Reg")
                }
                else if sidesCount[indexPath.row] == 2 {
                    cell.buildBurgerCustomTypeImageView.image = #imageLiteral(resourceName: "extra")
                }
            }
            return cell
        }
    }
}
