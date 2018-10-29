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
    var nowScrollStatus: ScrollDirection = ScrollDirection.scrollDown
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let height = scrollView.frame.height
        let contentOffsetY = scrollView.contentOffset.y
        let bottomOffset = scrollView.contentSize.height - contentOffsetY
        if bottomOffset <= height {
            print("在底")
        } else {
           print("在底")
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
            print("self.updateStatusBarWith(distance: distance)\(self.updateStatusBarWith(distance: distance))")
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

        bottomVariation = tabbarHeight * changeRatio
        
        let updateTabbarFrame = CGRect(origin: CGPoint(x: originTabbarFrame.minX,
                                                       y: originTabbarFrame.minY + bottomVariation),
                                       size: originTabbarFrame.size)

        self.tabBarController?.tabBar.frame = updateTabbarFrame
        
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
        
        if listTableView.contentOffset.y >= listTableView.contentSize.height - listTableView.frame.size.height {
            
            let updateNavBarFrame = CGRect(x: originNavBarFrame.minX,
                                           y: originStatusBarViewFrame.maxY  ,
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
        
        print("topVariation\(topVariation)")
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
