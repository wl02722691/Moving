//
//  FitnessNavigationController.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/28.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class FitnessNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        UINavigationBar.appearance().barTintColor?.withAlphaComponent(1)
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
}
