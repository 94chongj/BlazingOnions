//
//  ViewController.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/5/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func goToHomePage(_ sender: UITapGestureRecognizer) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toHomePage") as UIViewController
        self.present(viewController, animated: false, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

