//
//  FullScreenManger.swift
//  Moving
//
//  Created by 張書涵 on 2018/10/29.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

class FullScreenViewController: UIViewController {
    
    var scrollView: UIScrollView = UIScrollView()
    
    // object
    private weak var viewController: UIViewController?
    private weak var tabbarController: UITabBarController?
    private weak var navController: UINavigationController?
    private(set) var statusBarView: UIView!
    
    // origin value
    private var originVCFrame: CGRect = .zero
    private var originNavBarFrame: CGRect = .zero
    private var originNavCFrame: CGRect = .zero
    private var originTabCFrame: CGRect = .zero
    private var originTabbarFrame: CGRect = .zero
    private var originStatusBarViewFrame: CGRect = .zero
    private var topMaxVariation: CGFloat = 0.0
    private(set) var statusBarHeight: CGFloat = 0.0
    private(set) var tabbarHeight: CGFloat = 0.0
    private(set) var navbarHeight: CGFloat = 0.0
    
    // variation value
    private var lastOffset = CGPoint(x: 0.0, y: 0.0)
    private var topVariation: CGFloat = 0.0
    private var bottomVariation: CGFloat = 0.0
    fileprivate var isFirstScroll: Bool = true
    private var isAnimating: Bool = false
    
    // ParameterslastContentOffsetlastContentOffset
    fileprivate var delayDistance: CGFloat = 0.0
    fileprivate var scrollHideSpeed: CGFloat = 1
    fileprivate var topFloatingHeight: CGFloat = 0
    fileprivate var isTabBarScrollable = false
    fileprivate var isTopFloatingSpaceScrollable = true
    fileprivate var autoHideAndShowAfterScroll = true
    fileprivate var autoHideAndShowAfterScrollAnimationTime: TimeInterval = 0.3
    var nowScrollStatus: ScrollDirection = ScrollDirection.scrollDown
    var changeRatio: CGFloat = 0.0
    
    enum ScrollDirection: Equatable {
        case scrollUp
        case scrollDown
    }
    
    func isOnDelayRange(scrollView: UIScrollView) -> Bool {
        let contentOffset = scrollView.contentOffset
        if contentOffset.y <= delayDistance {
            return true
        } else {
            return false
        }
    }
    
    //call barUpdate() from child classes
    func barUpdate() {
        
        if isFirstScroll {
            
            setupInitData()
            
            storeOriginData()
            
            isFirstScroll = false
            
        }
        
        let currentOffset = scrollView.contentOffset
        let distance =  currentOffset.y - lastOffset.y
        
        self.lastOffset = currentOffset
        
        let isScrollDown = distance > 0
        if isOnDelayRange(scrollView: scrollView) && isScrollDown { return }
        
        if isScrollDown {
            nowScrollStatus = ScrollDirection.scrollDown
            
        } else {
            nowScrollStatus = ScrollDirection.scrollUp
        }
        
        if Thread.isMainThread {
            
            self.updateStatusBarWith(distance: distance)
            
            self.updateTabbar()
            
            self.updateNavBar()
            
            updateVCFrameWith()
            
        } else {
            
            DispatchQueue.main.async {
                self.updateStatusBarWith(distance: distance)
                
                self.updateTabbar()
                
                self.updateNavBar()
                
                self.updateVCFrameWith()
            }
        }
    }
    
    func barInit() {
        if statusBarHeight != 0 {
            
            self.view.frame = originVCFrame
            
            guard
                let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
                let statusBarView = statusBarWindow.value(forKey: "statusBar") as? UIView else { return }
            
            statusBarView.frame = originStatusBarViewFrame
            
            if let navController = self.navigationController {
                navController.navigationBar.frame = originNavBarFrame
                
            }
            
            self.tabBarController?.tabBar.frame = originTabbarFrame
            
        }
    }
    
    func setupInitData() {
        guard
            let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
            let statusBarView = statusBarWindow.value(forKey: "statusBar") as? UIView else { return }
        
        self.statusBarView = statusBarView
        
        self.originStatusBarViewFrame = statusBarView.frame
        
        self.statusBarHeight = statusBarView.bounds.height
        
        self.topMaxVariation = statusBarHeight +
            self.navigationController!.navigationBar.frame.height
        
    }
    
    func storeOriginData() {
        
        self.originVCFrame = self.view.frame
        
        if let navigationController = self.navigationController {
            
            self.originNavCFrame = navigationController.view.frame
        }
        
        if let navigationController = self.navigationController?.navigationBar {
            
            self.originNavBarFrame = navigationController.frame
            self.navbarHeight = navigationController.frame.height
        }
        
        if let tabbar = self.tabBarController {
            
            self.originTabCFrame = tabbar.view.frame
            self.originTabbarFrame = tabbar.tabBar.frame
            self.tabbarHeight = tabbar.tabBar.frame.height
            
        }
    }
    
    internal func updateStatusBarWith(distance: CGFloat) {
        
        topVariation -= distance
        
        if nowScrollStatus == ScrollDirection.scrollDown {
            
            topVariation = topVariation <= -topMaxVariation ? -topMaxVariation: topVariation
            
        } else {
            
            topVariation = topVariation >= 0 ? 0: topVariation
            
        }
        
        changeRatio = topVariation / -(topMaxVariation)
        
        guard
            let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
            let statusBarView = statusBarWindow.value(forKey: "statusBar") as? UIView else { return }
        
        self.originStatusBarViewFrame = statusBarView.frame
        var updateSBFrame = originStatusBarViewFrame
        updateSBFrame.origin = CGPoint(x: originStatusBarViewFrame.minX,
                                       y: topVariation)
        statusBarView.frame = updateSBFrame
        
    }
    
    func updateTabbar() {
        
        if let tabController = self.tabBarController {
            
            bottomVariation = tabbarHeight * changeRatio
            
            let updateTabbarFrame = CGRect(origin: CGPoint(x: originTabbarFrame.minX,
                                                           y: originTabbarFrame.minY + bottomVariation),
                                           size: originTabbarFrame.size)
            
            tabController.tabBar.frame = updateTabbarFrame
            
        }
        
    }
    
    private func updateNavBar() {
        
        if let navController = self.navigationController {
            if changeRatio != 0.0 {
                
                let updateNavBarFrame = CGRect(x: originNavBarFrame.minX,
                                               y: originNavBarFrame.minY + topVariation ,
                                               width: originNavBarFrame.width,
                                               height: originNavBarFrame.height)
                navController.navigationBar.frame = updateNavBarFrame
                
            } else {
                
                navController.navigationBar.frame = originNavBarFrame
                navController.view.frame = originNavCFrame
                
            }
        }
    }
    
    func updateVCFrameWith(distance: CGFloat = 0.0) {
        
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height {
            
            let updateNavBarFrame = CGRect(x: originNavBarFrame.minX,
                                           y: originStatusBarViewFrame.maxY  ,
                                           width: originNavBarFrame.width,
                                           height: originNavBarFrame.height)
            navController!.navigationBar.frame = updateNavBarFrame
            
            let updateTabbarFrame = CGRect(origin: CGPoint(x: -originTabbarFrame.minX,
                                                           y: -originTabbarFrame.minY ),
                                           size: originTabbarFrame.size)
            
            self.tabbarController?.tabBar.frame = updateTabbarFrame
            
        } else {
            
            let vcNextHeight = originVCFrame.height + (-topVariation) + bottomVariation
            
            let vcNextMinY = originVCFrame.minY + topVariation
            let vcNewFrame = CGRect(x: originVCFrame.minX,
                                    y: vcNextMinY,
                                    width: originVCFrame.width,
                                    height: vcNextHeight)
            
            self.view.frame = vcNewFrame
            
        }
    }
    
}
