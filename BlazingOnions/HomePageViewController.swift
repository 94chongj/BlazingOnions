//
//  HomePageViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/6/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    
    //scrollview's black sidescroller clips on the image
    @IBOutlet var twitterScrollView: UIScrollView!
    @IBOutlet var twitterImageView: UIImageView!
    
    // MARK: Home Page Buttons
    var isButtonActive: Bool = false
    
    
    @IBOutlet var serverAlertedView: UIView!
    @IBOutlet var waiterButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        //[<BlazingOnions.DrinksViewController 0x7fb493e28ad0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key dessertButton.' Wasn't an issue before I tried jumping to the "toDrinksPage"

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
            isButtonActive = true
            let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDrinksPage") as UIViewController
            self.present(HomePageViewController, animated: false, completion: nil)
            }
    }
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        if isButtonActive == true {
            drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            dessertButton.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Burger_Icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "Burger_Icon_active"), for: UIControlState.normal)
            sender.imageView?.contentMode = .scaleAspectFit
            sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            isButtonActive = true
            let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toFoodPage") as UIViewController
            self.present(HomePageViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func dessertButtonPressed(_ sender: UIButton) {
        if isButtonActive == true {
            drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_inactive"), for: UIControlState.normal)
            foodButton.setImage(#imageLiteral(resourceName: "Burger_Icon_inactive"), for: UIControlState.normal)
        }
        if sender.image(for: UIControlState.normal) == #imageLiteral(resourceName: "Dessert_icon_active") {
            sender.setImage(#imageLiteral(resourceName: "Dessert_icon_inactive"), for: UIControlState.normal)
            isButtonActive = false
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "Dessert_icon_active"), for: UIControlState.normal)
            sender.imageView?.contentMode = .scaleAspectFit
            sender.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            isButtonActive = true
            let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toDessertPage") as UIViewController
            self.present(HomePageViewController, animated: false, completion: nil)
        }
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
        }
    }
    
    @IBAction func hideServerAlertedView(_ sender: UIButton) {
        serverAlertedView.isHidden = true
    }
    
    
    @IBAction func totalButton(_ sender: UIButton) {
        
        let HomePageViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toTotalPage") as UIViewController
        self.present(HomePageViewController, animated: false, completion: nil)
        
    }
    
    //UIImages Animation Array Transitions
    
    @IBOutlet weak var specialsImages: UIImageView!
    
    @IBOutlet weak var instaImages: UIImageView!
    
    var specials_1: UIImage!
    var specials_2: UIImage!
    var specialImageArray: [UIImage]!
    var instaImage_1: UIImage!
    var instaImage_2: UIImage!
    var instaImage_3: UIImage!
    var instaImage_4: UIImage!
    var instaImageArray: [UIImage]!
    
    
    //continues to call UIViewTransition indefinitely while going through array of images
    func animatePoster(images: [UIImage], count: Int = 0) {
        
        UIView.transition(with: instaImages, duration: 6, options: [.curveEaseInOut, .transitionCrossDissolve], animations: {
            self.instaImages.image = self.instaImageArray[count]
        }, completion: {
            finished in
            if (count == self.instaImageArray.count - 1)  // Last image
            {
                self.animatePoster(images: self.instaImageArray)
            }
            else
            {
                self.animatePoster(images: self.instaImageArray, count: count + 1)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverAlertedView.isHidden = true
        specials_1 = #imageLiteral(resourceName: "Specials_banner_1")
        specials_2 = #imageLiteral(resourceName: "Specials_banner_2")
        specialImageArray = [specials_1, specials_2]
        UIImageView.transition(with: specialsImages, duration: 11, options: [.repeat, .autoreverse, .curveEaseInOut, .transitionCrossDissolve], animations: {
            if self.specialsImages.image == self.specials_1{
                self.specialsImages.image = self.specialImageArray[1]
            }
            else {
                self.specialsImages.image = self.specialImageArray[0]
            }}, completion: nil)
        
        instaImage_1 = #imageLiteral(resourceName: "insta_image_1")
        instaImage_2 = #imageLiteral(resourceName: "insta_image_2")
        instaImage_3 = #imageLiteral(resourceName: "insta_image_3")
        instaImage_4 = #imageLiteral(resourceName: "insta_image_4")
        instaImageArray = [instaImage_1, instaImage_2, instaImage_3, instaImage_4]
        
        animatePoster(images: instaImageArray)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        waiterButton.alpha = 1
        
        if waiterDataSource.sharedManager.waiterButtonBool == true {
            waiterButton.setImage(#imageLiteral(resourceName: "Waiter_icon_active"), for: UIControlState.normal)
            waiterButton.imageView?.contentMode = .scaleAspectFit
            waiterButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
            UIButton.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {self.waiterButton.alpha = 0.1}, completion: nil)
        }
    }
    
    
}



