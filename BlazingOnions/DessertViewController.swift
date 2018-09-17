//
//  DessertViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DessertViewController: UIViewController {
    
    
    
    @IBOutlet var servingSoonView: UIView!
    @IBOutlet var serverAlertedView: UIView!
    @IBOutlet var waiterButton: UIButton!
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
    
    @IBAction func dessertButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func waiterButtonPressed(_ sender: UIButton) {
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Waiter_icon_active") {
            sender.alpha = 1
            sender.setImage(#imageLiteral(resourceName: "Waiter_icon_inactive"), for: UIControlState.normal)
            waiterDataSource.sharedManager.waiterButtonBool = false
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "Waiter_icon_active"), for: UIControlState.normal)
            sender.imageView?.contentMode = .scaleAspectFit
            sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            UIButton.animate(withDuration: 1, delay: 0, options: [.autoreverse,.curveEaseInOut,.repeat,.allowUserInteraction], animations: {sender.alpha = 0.1}, completion: nil)
            waiterDataSource.sharedManager.waiterButtonBool = true
            serverAlertedView.isHidden = false
            waiterDataSource.sharedManager.serverViewStays = true
        }
    }
    
    @IBAction func hideServerAlertedView(_ sender: UIButton) {
        serverAlertedView.isHidden = true
        waiterDataSource.sharedManager.serverViewStays = false
        servingSoonView.isHidden = false
    }
    
    
    @IBAction func totalButtonPressed(_ sender: UIButton) {
        let DessertViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toTotalPage") as UIViewController
            self.present(DessertViewController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverAlertedView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_active"), for: UIControlState.normal)
        dessertButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        waiterButton.alpha = 1
        if waiterDataSource.sharedManager.serverViewStays == true {
            servingSoonView.isHidden = true
            serverAlertedView.isHidden = false
        }
        if waiterDataSource.sharedManager.waiterButtonBool == true {
            waiterButton.setImage(#imageLiteral(resourceName: "Waiter_icon_active"), for: UIControlState.normal)
            waiterButton.imageView?.contentMode = .scaleAspectFit
            waiterButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            UIButton.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {self.waiterButton.alpha = 0.1}, completion: nil)
        }
    }
    
}
