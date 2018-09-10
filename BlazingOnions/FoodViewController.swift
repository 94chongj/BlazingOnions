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
    //@IBOutlet weak var dessertButton: UIButton!
    
    
    @IBAction func toHomeButton(_ sender: UIButton) {
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        /*if isButtonActive == true {
            foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
            dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Drink_Icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else { */
        sender.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDrinksPage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func dessertButtonPressed(_ sender: UIButton) {
        /*if isButtonActive == true {
            drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Dessert_icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else { */
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        foodButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        gourmetImage.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        gourmetImage.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        
    }
    
}
