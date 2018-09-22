//
//  ListVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    private(set) public var lists = [ListModel]()
    private(set) public var selectLists = [ListModel]()
    private(set) public var actions = [ActionModel]()
    var selectSender = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.separatorStyle = .singleLine
    }
    
    func initList(category: FitnessCategory){
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
}

extension ListVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        actions = lists[index].actionModel
        selectSender = index
        
        performSegue(withIdentifier: "toActionVC", sender: selectLists)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionVC = segue.destination as? ActionVC {
            actionVC.lists = lists
            actionVC.actionLists = actions
            actionVC.selectSender = selectSender
        }
    }
}

extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listTableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell{
            let list = lists[indexPath.row]
            
            cell.updateView(listModel: list)
            cell.selectionStyle = .none
            return cell
            
        }else{
            
            return ListCell()
        }
    }
}
