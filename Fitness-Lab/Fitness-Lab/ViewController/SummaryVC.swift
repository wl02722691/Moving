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

    var lists =  [ListModel]()
    var actionLists = [ActionModel]()
    var selectSender = 0
    var scoreTitleLbl = "簡單"
    var summaryArray : Results<SummaryModel>!
    
    @IBOutlet weak var tableviewSummary: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = RealmService.shared.realm
        summaryArray = realm?.objects(SummaryModel.self)
        
        let editUpdatednotificationName = Notification.Name("toSummaryVC")
        NotificationCenter.default.addObserver(self, selector: #selector(updateRealm(noti:)), name: editUpdatednotificationName, object: nil)
        
    }
    
    @objc func updateRealm(noti:Notification) {
        
    }
    

}
