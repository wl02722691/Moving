////
////  SwipeGestureProtocal.swift
////  Moving
////
////  Created by 張書涵 on 2018/11/1.
////  Copyright © 2018年 AliceChang. All rights reserved.
////
//
//import Foundation
//
//
//protocol SwipeGestureProtocal {
//    
//    func swipeGesture()
//    
//    func respondToSwipeGesture(gesture: UIGestureRecognizer)
//    
//}
//
//extension SwipeGestureProtocal where Self: UIViewController {
//    
//    func swipeGesture() {
//        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//        
//    }
//    
//    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//        
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//            
//            switch swipeGesture.direction {
//                
//            case UISwipeGestureRecognizer.Direction.right:
//                print("Swiped right")
//                navigationController?.popViewController(animated: true)
//            case UISwipeGestureRecognizer.Direction.down:
//                print("Swiped down")
//            case UISwipeGestureRecognizer.Direction.left:
//                print("Swiped left")
//            case UISwipeGestureRecognizer.Direction.up:
//                print("Swiped up")
//                
//            default:
//                break
//            }
//        }
//    }
//}
//
//
