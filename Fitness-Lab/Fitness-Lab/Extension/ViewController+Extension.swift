//
//  ViewController+Extension.swift
//  Moving
//
//  Created by 張書涵 on 2018/10/23.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                dismiss(animated: true, completion: nil)
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
                
            default:
                break
            }
        }
    }
}
