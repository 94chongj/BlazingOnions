//
//  HomePageViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/6/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet var majorButtonBorderView: UIView!
    @IBOutlet var twitterScrollView: UIScrollView!
    @IBOutlet var twitterImageView: UIImageView!
    @IBOutlet var serverAlertedView: UIView!
    @IBOutlet var waiterButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    // MARK: Home Page Buttons
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
        sender.imageView?.contentMode = .scaleAspectFit
        sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDrinksPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)

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
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDessertPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)
        
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
            serverAlertedView.isHidden = false
            waiterDataSource.sharedManager.waiterButtonBool = true
            waiterDataSource.sharedManager.serverViewStays = true
        }
    }
    
    @IBAction func hideServerAlertedView(_ sender: UIButton) {
        serverAlertedView.isHidden = true
        waiterDataSource.sharedManager.serverViewStays = false
    }
    
    
    @IBAction func totalButton(_ sender: UIButton) {
        
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toTotalPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)
        
    }
    
    //UIImages Animation Array Transitions
    
    @IBOutlet weak var specialsImages: UIImageView!
    @IBOutlet weak var instaImages: UIImageView!
    
    var specialImageArray: [String] = ["Specials_banner_1", "Specials_banner_2"]
    var instaImageArray: [String] = ["insta_image_4", "insta_image_1", "insta_image_2", "insta_image_3"]
    var specialImageArrayCount: Int = 0
    var specialsTimer = Timer()
    var instaImageCount: Int = 0
    var instaTimer = Timer()
    
    @objc func onSpecialsBannerTransition() {
        if specialImageArrayCount < specialImageArray.count - 1 {
            specialImageArrayCount = specialImageArrayCount + 1
        }
        else {
            specialImageArrayCount = 0
        }
        UIView.transition(with: self.specialsImages, duration: 1.5, options: .transitionCrossDissolve, animations: {self.specialsImages.image = UIImage.init(named: self.specialImageArray[self.specialImageArrayCount])}, completion: nil)
    }
    
    @objc func onInstaImageTransition() {
        if instaImageCount < instaImageArray.count - 1 {
            instaImageCount = instaImageCount + 1
        }
        else {
            instaImageCount = 0
        }
        UIView.transition(with: self.instaImages, duration: 1.5, options: .transitionCrossDissolve, animations: {self.instaImages.image = UIImage.init(named: self.instaImageArray[self.instaImageCount])}, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverAlertedView.isHidden = true
        specialsImages.image = UIImage.init(named: "Specials_banner_1")
        specialsTimer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(onSpecialsBannerTransition), userInfo: nil, repeats: true)
        instaImages.image = UIImage.init(named: "insta_image_4")
        instaTimer = Timer.scheduledTimer(timeInterval: 4.5, target: self, selector: #selector(onInstaImageTransition), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        waiterButton.alpha = 1
        if waiterDataSource.sharedManager.serverViewStays == true {
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


