//
//  waiterDataSource.swift
//  BlazingOnions
//
//  Created by Jonathan Chong on 9/14/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class waiterDataSource {
    
    var waiterButtonBool: Bool = false
    var serverViewStays: Bool = false
    
    class var sharedManager: waiterDataSource {
        struct Static {
            static let instance = waiterDataSource()
        }
        return Static.instance
    }
}
