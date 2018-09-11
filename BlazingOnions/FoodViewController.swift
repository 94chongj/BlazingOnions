//
//  FoodViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    var isButtonActive: Bool = false
    
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var gourmetImage: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    @IBOutlet weak var appetizersButton: UIButton!
    @IBOutlet weak var sandwhichButton: UIButton!
    @IBOutlet weak var soupButton: UIButton!
    @IBOutlet weak var entreeButton: UIButton!
    @IBOutlet weak var blazersButton: UIButton!
    
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
    }
    
    @IBAction func gourmetButtonPressed(_ sender: UIButton) {
        gourmetImage.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        gourmetImage.imageView?.contentMode = .scaleAspectFit
        gourmetImage.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 1)
    }
    
    @IBAction func sandwhichButtonPressed(_ sender: UIButton) {
        sandwhichButton.setImage(#imageLiteral(resourceName: "sandwhich_-active"), for: UIControlState.normal)
        sandwhichButton.imageView?.contentMode = .scaleAspectFit
        sandwhichButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 2)
    }
    
    @IBAction func soupButtonPressed(_ sender: UIButton) {
        soupButton.setImage(#imageLiteral(resourceName: "soup_icon-active"), for: UIControlState.normal)
        soupButton.imageView?.contentMode = .scaleAspectFit
        soupButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 3)
    }
    
    
    @IBAction func entreeButtonPressed(_ sender: UIButton) {
        entreeButton.setImage(#imageLiteral(resourceName: "fish_icon-active"), for: UIControlState.normal)
        entreeButton.imageView?.contentMode = .scaleAspectFit
        entreeButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 4)
    }
    
    @IBAction func blazersButtonPressed(_ sender: UIButton) {
        blazersButton.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        blazersButton.imageView?.contentMode = .scaleAspectFit
        blazersButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        returnInactiveIcons(buttonID: 5)
    }
    
    func returnInactiveIcons(buttonID: Int) {
        var iconsArray: [UIButton] = [appetizersButton, gourmetImage, sandwhichButton, soupButton, entreeButton, blazersButton]
        iconsArray.remove(at: buttonID)
        var itemIcon : UIImage
        for button in 0 ..< iconsArray.count {
            if iconsArray[button] == appetizersButton{
                itemIcon = #imageLiteral(resourceName: "fries_icon-inactive")
                
            }
            else if iconsArray[button] == gourmetImage {
                itemIcon = #imageLiteral(resourceName: "Burger_Icon_inactive")
                
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
                itemIcon = #imageLiteral(resourceName: "Burger_Icon_inactive")
                
            }
            iconsArray[button].setImage(itemIcon, for: UIControlState.normal)
            iconsArray[button].imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        foodButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        gourmetImage.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        gourmetImage.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }

    
}
