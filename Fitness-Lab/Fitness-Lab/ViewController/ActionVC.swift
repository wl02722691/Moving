//
//  ActionVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ActionVC: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var intensityLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var actionTableView: UITableView!

    var lists =  [ListModel]()
    var actionLists = [ActionModel]()
    var selectSender = 0

    func initList(category: FitnessCategory){
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(lists)
        print(actionLists)
        
    }
}


extension ActionVC: UITableViewDelegate{}

extension ActionVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actionLists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = actionTableView.dequeueReusableCell(withIdentifier: "ActionCell") as? ActionCell{
            print(lists)
            let listIndex = lists[selectSender]
            print(listIndex)
            startBtn.clipsToBounds = true
            startBtn.layer.cornerRadius = 50
            videoTitle.text = listIndex.videoTitle
            videoImg.image = UIImage(named: listIndex.videoImg)
            intensityLbl.text = listIndex.intensity
            durationLbl.text = "\(listIndex.durationLbl)min"

        
            let actionlist = actionLists[indexPath.row]
            cell.updateView(actionModel: actionlist)
            cell.selectionStyle = .none
            return cell

        }else{

            return ActionCell()
        }
    }
}
