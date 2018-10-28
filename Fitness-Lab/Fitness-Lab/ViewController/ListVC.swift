//
//  ListVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var listTableviewTop: NSLayoutConstraint!
    @IBOutlet weak var listTableviewDown: NSLayoutConstraint!
    @IBOutlet var selectTimeBtns: [UIButton]!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var backgroundDismissBtn: UIButton!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    private(set) public var lists = [ListModel]()
    private(set) public var oldlists = [ListModel]()
    private(set) public var selectLists = [ListModel]()
    private(set) public var actions = [ActionModel]()
    var selectSender = 0
    var selectTimeSender = 0
    var listTableViewFirstFlag = true
    var lastContentOffset: CGFloat = 0
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
    //    fileprivate var isStatusBarScrollable = true
    fileprivate var isTabBarScrollable = false
    fileprivate var isTopFloatingSpaceScrollable = true
    fileprivate var autoHideAndShowAfterScroll = true
    fileprivate var autoHideAndShowAfterScrollAnimationTime: TimeInterval = 0.3
    var nowScrollStatus:ScrollDirection = ScrollDirection.scrollDown
    var changeRatio: CGFloat = 0.0
    
    // MARK: - initView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundDismissBtn.isHidden = true
        filterView.isHidden = true
        listTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "filter_Btn"),
                                                      style: .done, target: self,
                                                      action: #selector(filterBtnWasPressed))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.navigationItem.title = "\(lists.count) 個運動計畫"
        
        filterView.cornerRadius = 10
        okBtn.cornerRadius = 20
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GAManager.createNormalScreenEventWith("ListVC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
//
//        guard
//            let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
//            let statusBarView = statusBarWindow.value(forKey: "statusBar") as? UIView else { return }
//        statusBarView.frame = self.originStatusBarViewFrame
//
//
//        guard var navframe = self.navigationController?.navigationBar.frame else {return}
//        navframe = self.originNavCFrame
//
//
//        guard var tabBarframe = self.tabBarController?.tabBar.frame else {return}
//        tabBarframe = self.originTabbarFrame
//
//        self.view.frame = originVCFrame
    }
    
    func initList(category: FitnessCategory) {
        
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        oldlists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    @objc func filterBtnWasPressed() {
        
        if backgroundDismissBtn.isHidden == true {
            
            backgroundDismissBtn.isHidden = !false
            filterView.isHidden = false
            
        } else {
            
            backgroundDismissBtn.isHidden = true
            filterView.isHidden = true
            
        }
        
    }
    
    // MARK: - scroll bar animate
    
    func hideBar(panGestureY: CGFloat) {
        
        if listTableViewFirstFlag == true {
            self.listTableView.frame.size.height += (self.tabBarController?.tabBar.frame.size.height)!
            listTableViewFirstFlag = false
            
        }
        
        UIApplication.shared.isStatusBarHidden = true
        
        guard var tabBarframe = self.tabBarController?.tabBar.frame else {return}
        tabBarframe.origin.y -= panGestureY/10
        
        guard var navframe = self.navigationController?.navigationBar.frame else {return}
        navframe.origin.y +=  panGestureY/10
        
        
        if  navframe.origin.y < 0 - (navigationController?.navigationBar.frame.height)! {
            navframe.origin.y = 0 - (navigationController?.navigationBar.frame.height)!
        }
        
        self.tabBarController?.tabBar.frame = tabBarframe
        self.navigationController?.navigationBar.frame = navframe
        
        let frameMinY = view.frame.minY
        let frameWidth = view.frame.width
        let frameHeight = UIScreen.main.bounds.height + UIApplication.shared.statusBarFrame.size.height
        
        if frameMinY > 0 {
            view.frame = CGRect(x: 0, y: frameMinY+panGestureY/10, width: frameWidth, height: frameHeight)
        } else if frameMinY < 0 {
            view.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        }
        
    }
    
    func showBar(panGestureY: CGFloat) {
        
        UIApplication.shared.isStatusBarHidden = false
        
        guard var navframe = self.navigationController?.navigationBar.frame else {return}
        guard var tabBarframe = self.tabBarController?.tabBar.frame else {return}
        
        navframe.origin.y +=  panGestureY/10
        tabBarframe.origin.y -= panGestureY/10
        
        if navframe.origin.y >= UIApplication.shared.statusBarFrame.height {
            
            navframe.origin.y = UIApplication.shared.statusBarFrame.height
            listTableViewFirstFlag = true
            
        }
        
        if tabBarframe.origin.y <= UIScreen.main.bounds.height - (self.tabBarController?.tabBar.frame.size.height)! {
            
            tabBarframe.origin.y = UIScreen.main.bounds.height - (self.tabBarController?.tabBar.frame.size.height)!
            listTableViewFirstFlag = true
            
        }
        
        self.tabBarController?.tabBar.frame = tabBarframe
        self.navigationController?.navigationBar.frame = navframe
        
        var frameY = self.view.frame.minY
        
        if frameY < (navigationController?.navigationBar.frame.height)! {
            frameY += panGestureY/10
            
        } else if frameY > (navigationController?.navigationBar.frame.height)! {
            
            frameY = (navigationController?.navigationBar.frame.height)!
        }
        
        view.frame = CGRect(x: 0,
                            y: frameY,
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height)
        
    }
    
    // MARK: - Button
    
    @IBAction func slectTimeBtnTapped(_ sender: UIButton) {
        
        for button in selectTimeBtns {
            if button.tag == sender.tag {
                
                selectTimeSender = sender.tag
                
                button.borderColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
                button.borderWidth = 2
                button.cornerRadius = 15
            } else {
                button.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        
        if selectTimeSender == 0 {
            
            lists = oldlists
            
        } else if selectTimeSender == 1 {
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.max3 })
            
        } else if selectTimeSender == 2 {
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.threeToNine })
            
        } else if selectTimeSender == 3 {
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.min9 })
            
        }
        
        filterView.isHidden = true
        backgroundDismissBtn.isHidden = true
        listTableView.reloadData()
        self.navigationItem.title = "\(lists.count) 個運動計畫"
        
    }
    
    @IBAction func filterBtn(_ sender: UIButton) {
        if backgroundDismissBtn.isHidden == true {
            
            backgroundDismissBtn.isHidden = false
            filterView.isHidden = false
            
        } else {
            
            backgroundDismissBtn.isHidden = true
            filterView.isHidden = true
        }
    }
    
    @IBAction func backgroundDismissBtnWasPress(_ sender: UIButton) {
        filterView.isHidden = true
        backgroundDismissBtn.isHidden = true
        
    }
    
}

extension ListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        actions = lists[index].actionModel
        selectSender = index

        let topIndex = IndexPath(row: 0, section: 0)
        listTableView.scrollToRow(at: topIndex, at: UITableView.ScrollPosition.top, animated: false)
        
        performSegue(withIdentifier: "toActionVC", sender: selectLists)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionVC = segue.destination as? ActionVC {
            
                actionVC.lists = self.lists
                actionVC.actionLists = self.actions
                actionVC.selectSender = self.selectSender
                            
        }

    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //        let panGestureY = scrollView.panGestureRecognizer.translation(in: scrollView.superview).y
        //
        //        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0 {
        //
        //
        //            print("panGestureY\(panGestureY)")
        //            print("contentOffrest\(scrollView.contentOffset)")
        //            print("up")
        //           // showBar(panGestureY: panGestureY)
        //
        //        } else {
        //
        //            print("panGestureY\(panGestureY)")
        //            print("contentOffrest\(scrollView.contentOffset)")
        //            print("down")
        //            //hideBar(panGestureY: panGestureY)
        //
        //        }
        //        barUpdate()
        
        let index = IndexPath(row: 0, section: 0)
        guard let cell = listTableView.cellForRow(at: index) as? ListCell else {return}
        let visibleCell = listTableView.visibleCells.count
        
        if visibleCell * Int(cell.frame.height) > Int(listTableView.frame.height) {
            barUpdate()
        }
        
        
        
        
    }
    
    func isOnDelayRange(scrollView: UIScrollView) -> Bool {
        let contentOffset = scrollView.contentOffset
        if contentOffset.y <= delayDistance {
            return true
        } else {
            return false
        }
    }
    
    //    var changeRatio: CGFloat = 0.0 {
    //        didSet {
    //            if changeRatio == 0.0 {
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? true: false
    //                self.state = .collapsed
    //            } else if changeRatio == 1.0 {
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? false: true
    //                self.state = .collapsed
    //            } else {
    //                // avoid tap tabbar when user is scrolling (and isTabbarScrollable is true)
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? false: true
    //            }
    //        }
    //    }
    
    enum ScrollDirection: Equatable {
        case scrollUp
        case scrollDown
    }
    
    func barUpdate() {
        
        if isFirstScroll {
            storeOriginData()
            setupInitData()
            isFirstScroll = false
        }
        
        let currentOffset = listTableView.contentOffset
        let distance =  currentOffset.y - lastOffset.y
        self.lastOffset = currentOffset
        
        let isScrollDown = distance > 0
        if isOnDelayRange(scrollView: listTableView) && isScrollDown { return }
        
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
    
    //    var changeRatio: CGFloat = 0.0 {
    //        didSet {
    //            if changeRatio == 0.0 {
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? true: false
    //                self.state = .collapsed
    //            } else if changeRatio == 1.0 {
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? false: true
    //                self.state = .collapsed
    //            } else {
    //                // avoid tap tabbar when user is scrolling (and isTabbarScrollable is true)
    //                self.tabbarController?.tabBar.isUserInteractionEnabled = isTabBarScrollable ? false: true
    //            }
    //        }
    //    }
    
    //    func updateStatusBarWith(changeRatio: CGFloat) {
    //        topVariation = -topMaxVariation * changeRatio
    //        self.changeRatio = changeRatio
    //        if changeRatio != 0.0 {
    ////            switch updateType {
    ////            case .transform:
    ////                statusBarView.transform = CGAffineTransform(translationX: 0, y: topVariation)
    ////            case .changeFrame:
    //                var updateSBFrame = originStatusBarViewFrame
    //                updateSBFrame.origin = CGPoint(x: originStatusBarViewFrame.minX,
    //                                               y: topVariation)
    //                statusBarView.frame = updateSBFrame
    //  //          }
    //        } else {
    ////            switch updateType {
    ////            case .transform:
    ////                statusBarView.transform = CGAffineTransform.identity
    ////            case .changeFrame:
    //                statusBarView.frame = originStatusBarViewFrame
    //            //}
    //        }
    //    }
    
    func setupInitData() {
        guard
            let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow,
            let statusBarView = statusBarWindow.value(forKey: "statusBar") as? UIView else { return }
        self.statusBarView = statusBarView
        self.originStatusBarViewFrame = statusBarView.frame
        self.statusBarHeight = statusBarView.bounds.height
        self.topMaxVariation = statusBarHeight + (navigationController?.navigationBar.frame.height ?? 0)
        
    }
    
    func storeOriginData() {
        
        self.originVCFrame = self.view.frame
        
        if let navgation = self.navigationController {
            self.originNavCFrame = navgation.view.frame
            self.originNavBarFrame = navgation.navigationBar.frame
        }
        
        if let tabbar = self.tabBarController {
            self.originTabCFrame = tabbar.view.frame
            self.originTabbarFrame = tabbar.tabBar.frame
            self.tabbarHeight = tabbar.tabBar.frame.height
            
        }
    }
    
    private func updateStatusBarWith(distance: CGFloat) {
        topVariation -= distance * scrollHideSpeed
        if nowScrollStatus == ScrollDirection.scrollDown {
            // if statusBarNextYPosition less than -floatingViewHeight, set statusBarNewYPosition to -floatingViewHeight
            
            topVariation = topVariation <= -topMaxVariation ? -topMaxVariation: topVariation
        } else {
            // if statusBar.frame.y > 0, adjust it to zero
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
        //        if let tabbarController = self.tabbarController {
        bottomVariation = tabbarHeight * changeRatio
        //            if changeRatio != 0.0 {
        //                switch updateType {
        //                case .transform:
        //                    tabbarController.tabBar.transform = CGAffineTransform(translationX: 0.0,
        //                                                                          y: bottomVariation)
        //                case .changeFrame:
        //MARK: - You should never attempt to manipulate the UITabBar object itself stored in this property.
        //                    let tabbarCNewHeight = originTabCFrame.height + bottomVariation
        //                    let tabbarFrame = CGRect(origin: CGPoint(x: originTabCFrame.minX,
        //                                                             y: originTabCFrame.minY),
        //                                             size: CGSize(width: originTabCFrame.width,
        //                                                          height: tabbarCNewHeight))
        // tabbarController.view.frame = tabbarFrame
        
        let updateTabbarFrame = CGRect(origin: CGPoint(x: originTabbarFrame.minX,
                                                       y: originTabbarFrame.minY + bottomVariation),
                                       size: originTabbarFrame.size)
        //       tabbarController.tabBar.frame = updateTabbarFrame
        self.tabBarController?.tabBar.frame = updateTabbarFrame
        
        print()
        
    }
    
    //    }
    //
    private func updateNavBar() {
        if let navController = self.navigationController {
            if changeRatio != 0.0 {
                //   switch updateType {
                //                case .transform:
                //                    navController.navigationBar.transform = CGAffineTransform(translationX: 0.0,
                //                                                                              y: topVariation)
                //                case .changeFrame:
                //MARK: - can't directly change navigationBar frame, so change navigationController frame
                let updateNavBarFrame = CGRect(x: originNavBarFrame.minX,
                                               y: originNavBarFrame.minY + topVariation ,
                                               width: originNavBarFrame.width,
                                               height: originNavBarFrame.height)
                navController.navigationBar.frame = updateNavBarFrame
                
                //  }
            } else {
                //                switch updateType {
                //                case .transform:
                //                    navController.navigationBar.transform = CGAffineTransform.identity
                //
                //                case .changeFrame:
                //MARK: - can't directly change navigationBar frame, so change navigationController frame
                navController.navigationBar.frame = originNavBarFrame
                navController.view.frame = originNavCFrame
            }
        }
    }
    
    
    func updateVCFrameWith(distance: CGFloat = 0.0) {
        
        if (listTableView.contentOffset.y >= listTableView.contentSize.height - listTableView.frame.size.height) {
            
            let updateNavBarFrame = CGRect(x: originNavBarFrame.minX,
                                           y: -100  ,
                                           width: originNavBarFrame.width,
                                           height: originNavBarFrame.height)
            self.navigationController?.navigationBar.frame = updateNavBarFrame
            
            let updateTabbarFrame = CGRect(origin: CGPoint(x: -originTabbarFrame.minX,
                                                           y: -originTabbarFrame.minY ),
                                           size: originTabbarFrame.size)
            
            self.tabBarController?.tabBar.frame = updateTabbarFrame
            
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

extension ListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = listTableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell {
            
            let list = lists[indexPath.row]
            cell.updateView(listModel: list)
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            return ListCell()
        }
    }
    
}
