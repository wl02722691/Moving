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
        
    }
    

    

}

extension SettingVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print(indexPath.row)
    }
}

extension SettingVC: UITableViewDataSource{


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return Data.instance.getSettingArray().count
        }
        
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        guard let cell = tableViewSetting.dequeueReusableCell(withIdentifier: "SettingCell") as? SettingCell else {return UITableViewCell()}

            var settingArray = Data.instance.getSettingArray()[indexPath.row]
            tableViewSetting.separatorStyle = UITableViewCellSeparatorStyle.none
            cell.selectionStyle = .none
            cell.updateView(settingModel: settingArray)
        
            return cell
        }
    



    
    
}

