//
//  ListVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet var selectTimeBtns: [UIButton]!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var backgroundDismissBtn: UIButton!
    @IBOutlet weak var planNumberLbl: UILabel!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    private(set) public var lists = [ListModel]()
    private(set) public var oldlists = [ListModel]()
    private(set) public var selectLists = [ListModel]()
    private(set) public var actions = [ActionModel]()
    var selectSender = 0
    var selectTimeSender = 0
    
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
            }else{
                button.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    
    @IBAction func okBtn(_ sender: UIButton) {
    
        if selectTimeSender == 0 {
            
            lists = oldlists
//            filterView.isHidden = true
//            backgroundDismissBtn.isHidden = true
//            listTableView.reloadData()
        }else if selectTimeSender == 1{
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.max3 })
//
//            filterView.isHidden = true
//            backgroundDismissBtn.isHidden = true
//            listTableView.reloadData()
        }else if selectTimeSender == 2{
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.threeToNine })
//            filterView.isHidden = true
//            backgroundDismissBtn.isHidden = true
//            listTableView.reloadData()
        }else if selectTimeSender == 3{
            lists = oldlists
            lists = lists.filter({ $0.timeRange == TimeRange.min9 })
//            filterView.isHidden = true
//            backgroundDismissBtn.isHidden = true
//            listTableView.reloadData()
        }
        
        filterView.isHidden = true
        backgroundDismissBtn.isHidden = true
        listTableView.reloadData()
        planNumberLbl.text = "\(lists.count) 個運動計畫"
       
        
        
    }
    
    
    @IBAction func filterBtn(_ sender: UIButton) {
        if backgroundDismissBtn.isHidden == true{
        
            
            
            
            
            backgroundDismissBtn.isHidden = false
            filterView.isHidden = false
          
            
//            for button in selectTimeBtns {
//                if button.tag == sender.tag {
//
//
//                    button.borderColor = #colorLiteral(red: 0.001363023831, green: 0.6588945239, blue: 0.2931115911, alpha: 1)
//                    button.borderWidth = 2
//                    button.cornerRadius = 15
//
//
//                }else{
//                    button.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                }
//            }
        } else {
            
            backgroundDismissBtn.isHidden = true
            filterView.isHidden = true
        }
    }
    
    @IBAction func backgroundDismissBtnWasPress(_ sender: UIButton) {
        filterView.isHidden = true
        backgroundDismissBtn.isHidden = true
        
    }
    
    
    override func viewDidLoad() {
        backgroundDismissBtn.isHidden = true
        filterView.isHidden = true
        listTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        
    }
    
    func initList(category: FitnessCategory) {
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        oldlists = Data.instance.getList(forListTitle: category.secondTitle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        planNumberLbl.text = "\(lists.count) 個運動計畫"
        filterView.cornerRadius = 10
        okBtn.cornerRadius = 20
        GAManager.createNormalScreenEventWith("ListVC")
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
        //to ActionVC
        if let actionVC = segue.destination as? ActionVC {
            actionVC.lists = lists
            actionVC.actionLists = actions
            actionVC.selectSender = selectSender
            
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
