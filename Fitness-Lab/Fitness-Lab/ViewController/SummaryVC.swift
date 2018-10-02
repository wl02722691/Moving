//
//  SummaryVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/26.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift
class SummaryVC: UIViewController {

    var allTime = 0
    var allTimeToMin = 0
    var sectionHeaderTitleArray = ["運動總數","挑戰"]
    var summaryArray : Results<SummaryModel>!
    
    @IBOutlet weak var tableviewSummary: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSummary.delegate = self
        tableviewSummary.dataSource = self
        
        tableviewSummary.register(UINib(nibName: "Summary1Cell", bundle: nil), forCellReuseIdentifier: "Summary1Cell")
        tableviewSummary.register(UINib(nibName: "Summary2Cell", bundle: nil), forCellReuseIdentifier: "Summary2Cell")
        
        
        let realm = RealmService.shared.realm
        summaryArray = realm?.objects(SummaryModel.self)
        
        let editUpdatednotificationName = Notification.Name("toSummaryVC")
        NotificationCenter.default.addObserver(self, selector: #selector(updateRealm(noti:)), name: editUpdatednotificationName, object: nil)
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true)
        
        if summaryArray.count - 1 > 0 {
            for summaryArrayIndex in 0 ... summaryArray.count - 1{
                allTime += summaryArray[summaryArrayIndex].durationLbl
               
            }
        }
        
        allTimeToMin = allTime % 60
        
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = self.tableviewSummary.cellForRow(at: indexPath) as? Summary1Cell  else {return}
        cell.allTimeLbl.text = String(allTimeToMin)
        tableviewSummary.reloadData()
        
        
    }
    
    @objc func updateRealm(noti:Notification) {
        if summaryArray.count - 1 > 0 {
            for summaryArrayIndex in 0 ... summaryArray.count - 1{
                allTime += summaryArray[summaryArrayIndex].durationLbl
                print(allTime)
            }
        }
        tableviewSummary.reloadData()
    }
    

}

extension SummaryVC: UITableViewDelegate{}

extension SummaryVC: UITableViewDataSource{
    
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
        
        tableviewSummary.separatorStyle = UITableViewCellSeparatorStyle.none
        let index = indexPath.row
        
        switch indexPath.section {
        case 0:
            
            guard let cell = tableviewSummary.dequeueReusableCell(withIdentifier: "Summary1Cell") as? Summary1Cell else {return Summary1Cell()}
            cell.planNumberLbl.text = String(summaryArray.count)
            cell.allTimeLbl.text = String(allTimeToMin)
            cell.selectionStyle = .none
            
            
            return cell
            
        case 1:
            
            guard let cell = tableviewSummary.dequeueReusableCell(withIdentifier: "Summary2Cell") as? Summary2Cell else { return Summary2Cell()}
     
            cell.updateView(summaryModel: summaryArray.reversed()[index])
            cell.selectionStyle = .none
            
            return cell
            
        default:
            break
        }
     
        return Summary1Cell()
       
    }
    
    
}
