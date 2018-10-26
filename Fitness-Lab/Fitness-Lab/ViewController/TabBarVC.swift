//
//  TabBarVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItems = tabBar.items! as [UITabBarItem]
        
        tabBarItems[0].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItems[1].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItems[2].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1411764706, blue: 0.1411764706, alpha: 1)
        UITabBar.appearance().barTintColor?.withAlphaComponent(1)
        
    }
}
