////
////  SwipeGestureProtocal.swift
////  Moving
////
////  Created by 張書涵 on 2018/11/1.
////  Copyright © 2018年 AliceChang. All rights reserved.
////

import Foundation
import UIKit

protocol SwipeGestureProtocol: AnyObject {
    
    func swipeGesture()
    
}

extension SwipeGestureProtocol where Self: UIViewController {
    
    func swipeGesture() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
}
