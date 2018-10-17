//
//  FitnessVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

class FitnessVC: UIViewController {
    
    @IBOutlet weak var fitnessTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fitnessTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        fitnessTableview.delegate = self
        fitnessTableview.dataSource = self
       navigationController?.navigationBar.isHidden = false
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GAManager.createNormalScreenEventWith("FitnessVC")
        viewWillLayoutSubviews()
    }
}

//swiftlint:disable force_cast

extension FitnessVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fitnessTableview.frame.size.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = Data.instance.getfitCategories()[indexPath.row]
        print(list)
        
        performSegue(withIdentifier: "toListVC", sender: list)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let listVC = segue.destination as? ListVC {
            listVC.initList(category: sender as! FitnessCategory)
        }
    }
}

extension FitnessVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.instance.getfitCategories().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = fitnessTableview.dequeueReusableCell(withIdentifier: "FitnessCell") as? FitnessCell {
            let category = Data.instance.getfitCategories()[indexPath.row]
            cell.updataViews(fitnessCategory: FitnessCellModel(category: category))
            cell.selectionStyle = .none
            cell.frame.size.height = fitnessTableview.frame.height / 4
            return cell
            
            
        } else {
            
            return FitnessCell()
        }
    }
}
