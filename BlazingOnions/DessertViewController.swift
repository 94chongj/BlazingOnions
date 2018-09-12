//
//  DessertViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DessertViewController: UIViewController {
    
    
    @IBOutlet weak var dessertButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    var isButtonActive: Bool = true
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        let DessertViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(DessertViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func drinksButtonPressed(_ sender: UIButton) {
        if isButtonActive == true {
            foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
            dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Drink_Icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
            sender.imageView?.contentMode = .scaleAspectFit
            sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDrinksPage") as UIViewController
            self.present(FoodViewController, animated: false, completion: nil)
        }
    }
    
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        /*if isButtonActive == true {
            drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Burger_Icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else {*/
        sender.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        isButtonActive = true
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toFoodPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)
    
    }
    
    @IBAction func totalButtonPressed(_ sender: UIButton) {
        let DessertViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toTotalPage") as UIViewController
            self.present(DessertViewController, animated: false, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_active"), for: UIControlState.normal)
        dessertButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }
    
}
