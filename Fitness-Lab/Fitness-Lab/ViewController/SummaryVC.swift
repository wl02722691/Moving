//
//  SummaryVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/26.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift
import Lottie

class SummaryVC: UIViewController {
    
    var allTime = 0
    var allTimeToMin = 0
    var sectionHeaderTitleArray = ["運動總數", "挑戰"]
    var summaryArray: Results<SummaryModel>!
    var animationView = LOTAnimationView()

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var summaryTableview: UITableView!
    @IBOutlet weak var workoutNowBtn: UIButton!
    @IBOutlet weak var workoutTomorrowBtn: UIButton!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        animationView.removeFromSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryTableview.delegate = self
        summaryTableview.dataSource = self
        
        summaryTableview.register(UINib(nibName: "Summary1Cell", bundle: nil), forCellReuseIdentifier: "Summary1Cell")
        summaryTableview.register(UINib(nibName: "Summary2Cell", bundle: nil), forCellReuseIdentifier: "Summary2Cell")
        
        let realm = RealmService.shared.realm
        summaryArray = realm?.objects(SummaryModel.self)
        
        let notificationName = Notification.Name("addNewData")
        NotificationCenter.default.addObserver(self, selector: #selector(updateRealm(noti:)), name: notificationName, object: nil)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        animationView.play()
        
         GAManager.createNormalScreenEventWith("SummaryVC")
        
        allTime = 0
        
        if summaryArray.count - 1 > 0 {
            for summaryArrayIndex in 0 ... summaryArray.count - 1 {
                allTime += summaryArray[summaryArrayIndex].durationLbl
            }
            
        } else if summaryArray.count == 1 {
            allTime = summaryArray[0].durationLbl
        }

        allTimeToMin = allTime / 60
        
        

        if summaryArray.count == 0 {
            firstView.isHidden = false
            loadAnimateView()
            
        } else {
            
            firstView.isHidden = true
        }
    }
    
    func loadAnimateView() {
       
            animationView = LOTAnimationView(name: "empty_box")
            animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            animationView.center = CGPoint(x: self.view.center.x, y: self.view.center.y-120)
            animationView.contentMode = .scaleAspectFit
            animationView.loopAnimation = true
            animationView.play()
            self.view.addSubview(animationView)
        
            workoutNowBtn.cornerRadius = 25
            workoutTomorrowBtn.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            workoutTomorrowBtn.borderWidth = 2
            workoutTomorrowBtn.cornerRadius = 25
    
    }
    
    @IBAction func workoutNowBtn(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func workoutTomorrowBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let settingVC = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as? NotificationVC else {return}
        
        self.show(settingVC, sender: nil)
        
    }
    
    @objc func updateRealm(noti: Notification) {
        
        allTime = 0
        
        if summaryArray.count - 1 > 0 {
            
            for summaryArrayIndex in 0 ... summaryArray.count - 1 {
                
                allTime += summaryArray[summaryArrayIndex].durationLbl
                
            }
            
        } else if summaryArray.count == 1 {
            
            allTime += summaryArray[0].durationLbl
        }
        
        allTimeToMin = allTime / 60
        
        
        animationView.stop()
       
        animationView.removeFromSuperview()
        
        summaryTableview.reloadData()
    }
    
}

extension SummaryVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        } else {
            return 150
        }
    }
    
}

extension SummaryVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return summaryArray.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            
        case 0: return "運動總數"
        case 1: return "挑戰"
        default: return "挑戰"
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: view.frame.size.width, height: 25))
        label.text = self.sectionHeaderTitleArray[section]
        label.textColor = UIColor.white
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        summaryTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        let index = indexPath.row
        
        switch indexPath.section {
        case 0:
            
            guard let cell = summaryTableview.dequeueReusableCell(withIdentifier: "Summary1Cell") as? Summary1Cell
                else {return Summary1Cell()}
            cell.planNumberLbl.text = String(summaryArray.count)
            cell.allTimeLbl.text = String(allTimeToMin)
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            
            guard let cell = summaryTableview.dequeueReusableCell(withIdentifier: "Summary2Cell") as? Summary2Cell
                else { return Summary2Cell()}
            
            cell.updateView(summaryModel: summaryArray.reversed()[index])
            cell.selectionStyle = .none
            
            return cell
            
        default:
            break
        }
        return Summary1Cell()
    }
    
}
