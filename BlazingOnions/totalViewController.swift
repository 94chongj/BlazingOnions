//
//  totalViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/7/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    
    @IBAction func homeButton(_ sender: UIButton) {
        let TotalViewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(TotalViewController, animated: false, completion: nil)
    }
    
    @IBOutlet weak var orderSubmitLabel: UILabel!
    
    @IBAction func submitOrderButton(_ sender: UIButton) {
        orderSubmitLabel.alpha = 1.0
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {self.orderSubmitLabel.alpha = 0.0}, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
}
