//
//  InformationVC.swift
//  Moving
//
//  Created by 張書涵 on 2018/10/12.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GAManager.createNormalScreenEventWith("InformationVC")
    }
  
}
