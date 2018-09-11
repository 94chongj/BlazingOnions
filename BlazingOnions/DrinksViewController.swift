//
//  DrinksViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
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
    
    
    @IBOutlet var drinksCollectionView: UICollectionView!
    
    let dataSource = DataSource()
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/3, height: collectionView.bounds.size.width/3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinksCollectionView!.register(drinkCell.self, forCellWithReuseIdentifier: "Cell")
        drinksCollectionView.dataSource = dataSource
        //requires setting collectionView.delegate to self in order for extension to work
        self.drinksCollectionView.delegate = self
        if let layout = drinksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 1 //in between columns
            layout.minimumInteritemSpacing = 1 //in between rows
        }
        drinksCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        drinkButton.setImage(#imageLiteral(resourceName: "Drink_Icon_active"), for: UIControlState.normal)
        drinkButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
        barButton.setImage(#imageLiteral(resourceName: "Bar_icon_active"), for: UIControlState.normal)
        barButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12)
    }
    
}
