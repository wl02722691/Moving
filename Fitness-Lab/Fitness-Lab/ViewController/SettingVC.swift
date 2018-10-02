//
//  SettingVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    @IBOutlet weak var tableViewSetting: UITableView!
    var settingArray = [SettingModel(titleLbl: "", statusLbl: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableViewSetting.delegate = self
        tableViewSetting.dataSource = self
        tableViewSetting.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
         tableViewSetting.register(UINib(nibName: "SettingSwitchCell", bundle: nil), forCellReuseIdentifier: "SettingSwitchCell")
        
    }
    

    

}

extension SettingVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print(indexPath.row)
    }
}

extension SettingVC: UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 3
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        
        tableViewSetting.separatorStyle = UITableViewCellSeparatorStyle.none
        let index = indexPath.row
        
        switch indexPath.section {
        case 0:
        guard let cell = tableViewSetting.dequeueReusableCell(withIdentifier: "SettingCell") as? SettingCell else {return UITableViewCell()}

            var settingArray = Data.instance.getSettingArray()[indexPath.row]
            tableViewSetting.separatorStyle = UITableViewCellSeparatorStyle.none
            cell.selectionStyle = .none
            cell.updateView(settingModel: settingArray)
        
            return cell
            
        case 1:
            
            guard let cell = tableViewSetting.dequeueReusableCell(withIdentifier: "SettingSwitchCell") as? SettingSwitchCell else {return UITableViewCell()}
            cell.updateView(settingModel: Data.instance.getSettingSwitchArray()[indexPath.row])
            cell.selectionStyle = .none
            
            return cell
            
        default:
            break
        }
        return UITableViewCell()
}

}
