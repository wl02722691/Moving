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
    
    private let cellIdenfifier = String(describing: FitnessCell.self)
    @IBOutlet weak var fitnessTableview: UITableView!

// MARK: - initView
    
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

// MARK: - Table view delegate

extension FitnessVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1. set the initaial state of the cell
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        
            cell.layer.transform = transform
        
        //2. UIView animation method to chang to the final state of the cell
        UIView.animate(withDuration: 0.3) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return fitnessTableview.frame.size.height / 2
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let list = Database.instance.getfitCategories()[indexPath.row]
        performSegue(withIdentifier: "toListVC", sender: list)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let listVC = segue.destination as? ListVC {
            
            listVC.initList(category: (sender as? FitnessCategory)!)
            
        }
    }
    
}

// MARK: - Table view data source

extension FitnessVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Database.instance.getfitCategories().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = fitnessTableview.dequeueReusableCell(withIdentifier: cellIdenfifier ) as? FitnessCell {
            
            let category = Database.instance.getfitCategories()[indexPath.row]
            cell.updataViews(fitnessCategory: FitnessCellModel(category: category))
            cell.selectionStyle = .none
        
            return cell
            
        } else {
            
            return FitnessCell()
        }
    }
    
}
