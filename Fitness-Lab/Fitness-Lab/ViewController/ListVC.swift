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
     private var isAnimating: Bool = false

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
        
        guard var tabBarframe = self.tabBarController?.tabBar.frame else {return}
        tabBarframe.origin.y = UIScreen.main.bounds.height - (self.tabBarController?.tabBar.frame.size.height)!
        self.tabBarController?.tabBar.frame = tabBarframe
        
        guard var navframe = self.navigationController?.navigationBar.frame else {return}
        navframe.origin.y = UIApplication.shared.statusBarFrame.height
        self.navigationController?.navigationBar.frame = navframe
        
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
        
        print(selectTimeBtns[sender.tag])
        print(sender.tag)
        
        for button in selectTimeBtns {
            if button.tag == sender.tag {
                
                selectTimeSender = sender.tag
                print("selectTimeSender\(selectTimeSender)")
                
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
        
        performSegue(withIdentifier: "toActionVC", sender: selectLists)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionVC = segue.destination as? ActionVC {
            
            DispatchQueue.global(qos: .userInitiated).async() {
                
                actionVC.lists = self.lists
                actionVC.actionLists = self.actions
                actionVC.selectSender = self.selectSender
                
            }
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
