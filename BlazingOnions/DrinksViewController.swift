//
//  DrinksViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {
    
    
    @IBOutlet weak var drinkButton: UIButton!
    
    @IBOutlet weak var barButton: UIButton!
    
    @IBOutlet weak var fountainButton: UIButton!
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        let DrinksViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(DrinksViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toFoodPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)
    }
    
    @IBAction func dessertButtonPressed(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Dessert_icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let FoodViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDessertPage") as UIViewController
        self.present(FoodViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func fountainButtonPressed(_ sender: UIButton) {
        fountainButton.setImage(#imageLiteral(resourceName: "fountain_icon_active"), for: UIControlState.normal)
        fountainButton.imageView?.contentMode = .scaleAspectFit
        fountainButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        barButton.setImage(#imageLiteral(resourceName: "Bar_icon_inactive"), for: UIControlState.normal)
        barButton.imageView?.contentMode = .scaleAspectFit
        barButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }
    
    @IBAction func barButtonPressed(_ sender: UIButton) {
        barButton.setImage(#imageLiteral(resourceName: "Bar_icon_active"), for: UIControlState.normal)
        barButton.imageView?.contentMode = .scaleAspectFit
        barButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        fountainButton.setImage(#imageLiteral(resourceName: "fountain_icon_inactive"), for: UIControlState.normal)
        fountainButton.imageView?.contentMode = .scaleAspectFit
        fountainButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
        drinkButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        barButton.setImage(#imageLiteral(resourceName: "Bar_icon_active"), for: UIControlState.normal)
        barButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }
    
}
