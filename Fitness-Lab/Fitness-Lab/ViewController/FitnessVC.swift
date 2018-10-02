//
//  FitnessVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import UserNotifications

class FitnessVC: UIViewController {
    
    @IBOutlet weak var fitnessTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fitnessTableview.separatorStyle = UITableViewCellSeparatorStyle.none
        fitnessTableview.delegate = self
        fitnessTableview.dataSource = self
        let timeInterval = Date().timeIntervalSince1970
        print(timeInterval)
    }

//swiftlint:disable force_try
//func scheduleNotification() {
//    let content = UNMutableNotificationContent()
//    content.title = "YOYOYOYO time to go home"
//    content.subtitle = "Alice HIHIHI"
//    content.body = "今天辛苦了❤️"
//    content.badge = 1
//    content.sound = UNNotificationSound(named: "gong")
//    let imageURL = Bundle.main.url(forResource: "YOYOYO", withExtension: "png")
//    let attachement = try! UNNotificationAttachment(identifier: "YOYOYO.png", url: imageURL!, options: nil)
//    content.attachments = [attachement]
//    
//    var dateComponents = DateComponents()
//    dateComponents.hour = 14
//    dateComponents.minute = 13
//    
//    
//    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//    let request = UNNotificationRequest(identifier: "eveydayNotification", content: content, trigger: trigger)
//    
//    let notificationCenter = UNUserNotificationCenter.current()
//    notificationCenter.add(request, withCompletionHandler: nil)
//    notificationCenter.delegate = self
//    
//    
//    }
}

//swiftlint:disable force_cast

extension FitnessVC: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print(response.notification.request.content.userInfo)
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("silently handle notification")
        completionHandler([.alert, .sound])
    }
}

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
            cell.updataViews(
                fitnessCategory: FitnessCellModel(category: category)
            )
            
            cell.selectionStyle = .none
            return cell
        }else {
            
            
            return FitnessCell()
        }
    }
}

