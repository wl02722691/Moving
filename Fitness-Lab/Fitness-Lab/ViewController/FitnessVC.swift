//
//  FitnessVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class FitnessVC: UIViewController {
    
    @IBOutlet weak var fitnessTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fitnessTableview.separatorStyle = UITableViewCellSeparatorStyle.none
        fitnessTableview.delegate = self
        fitnessTableview.dataSource = self

    }
}

//swiftlint:disable force_cast

extension FitnessVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1. set the initaial state of the cell
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        //2. UIView animation method to chang to the final state of the cell
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
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
            cell.updataViews(fitnessCategory: category)
            cell.selectionStyle = .none
            return cell
        }else {
            return FitnessCell()
        }
    }
    
    
}
