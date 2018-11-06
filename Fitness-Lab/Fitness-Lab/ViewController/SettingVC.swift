//
//  SettingVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import MessageUI
import UserNotifications
import StoreKit
import HealthKit

class SettingVC: UIViewController, NotificationAuthProtocal {
    
    private let cellIdenfifierSettingCell = String(describing: SettingCell.self)
    private let cellIdenfifierSettingSwitchCell = String(describing: SettingSwitchCell.self)
    
    var settingArray = [SettingModel(titleLbl: "", statusLbl: "")]
    var cueToneStatus: CueTone = .open
    var settingSwitchArray = Database.instance.getSettingSwitchArray()
    let healthStore: HKHealthStore = HKHealthStore()
    
    @IBOutlet weak var settingTableView: UITableView!

// MARK: - initView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.bounces = false
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: "SettingCell", bundle: nil),
                                  forCellReuseIdentifier: "SettingCell")
        settingTableView.register(UINib(nibName: "SettingSwitchCell", bundle: nil),
                                  forCellReuseIdentifier: "SettingSwitchCell")
        
        let editUpdatednotificationName = Notification.Name("notificationUpdate")
        NotificationCenter.default.addObserver(self, selector: #selector(notificationUpdate(noti:)),
                                               name: editUpdatednotificationName, object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    
        GAManager.createNormalScreenEventWith("SettingVC")
        loadNotificationTime()
        cueTone()
        appleHealth()
        
    }
    
// MARK: - Local Notification
    
    func loadNotificationTime() {
        
        if let notificationTime = UserDefaults.standard.value(forKey: "notificationtime") as? String {
            
            let indexPath = IndexPath(row: 3, section: 0)
            guard let cell = self.settingTableView.cellForRow(at: indexPath) as? SettingCell  else {return}
            cell.statusLbl.text = notificationTime
    
        }
        
    }
    
    @objc func notificationUpdate(noti: Notification) {
        
        let notificationTime = noti.userInfo!["timeString"] as? String
        let indexPath = IndexPath(row: 3, section: 0)
        guard let cell = self.settingTableView.cellForRow(at: indexPath) as? SettingCell  else {return}
        cell.statusLbl.text = notificationTime
        UserDefaults.standard.set(notificationTime, forKey: "notificationtime")
        
    }
    
// MARK: - CueTone
    
    func cueTone() {
        
        let index = IndexPath(row: 0, section: 1)
        
        guard let cell = settingTableView.cellForRow(at: index) as? SettingSwitchCell else {return}
    
        cell.statusSwitch.addTarget(self, action: #selector(cueToneSwitchValueChange(mySwitch:)),
                                    for: UIControl.Event.valueChanged)
        
        if let cueToneStatus = UserDefaults.standard.value(forKey: "cueTone") as? Bool {
            
           cell.statusSwitch.setOn(cueToneStatus, animated: false)
        
        } else {
            
            cell.statusSwitch.setOn(true, animated: false)
            
        }

    }
    
    @objc func cueToneSwitchValueChange(mySwitch: UISwitch) {
        
        if mySwitch.isOn == true {
            
            let notificationName = Notification.Name("cueTone")
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["cueTone": true])
            UserDefaults.standard.set(true, forKey: "cueTone")
            
        } else {
            
            let notificationName = Notification.Name("cueTone")
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["cueTone": false])
            UserDefaults.standard.set(false, forKey: "cueTone")
        }
        
    }
    
// MARK: - appleHealth
    
    func appleHealth() {
        
        let index = IndexPath(row: 1, section: 1)
        
        guard let cell = settingTableView.cellForRow(at: index) as? SettingSwitchCell else {return}
        
        if let appleHealth = UserDefaults.standard.value(forKey: "appleHealth") as? Bool {
            
            cell.statusSwitch.setOn(appleHealth, animated: false)
            
        } else {
            
            cell.statusSwitch.setOn(false, animated: false)
            
        }
        
        cell.statusSwitch.addTarget(self, action: #selector(applehealthSwitchValueChange(mySwitch:)),
                                    for: UIControl.Event.valueChanged)
        
    }
    
    @objc func applehealthSwitchValueChange(mySwitch: UISwitch) {
        
        if mySwitch.isOn == true {
            
            if auth() == true {
                
                UserDefaults.standard.set(true, forKey: "appleHealth")
                
            }
            
        } else {
            
            UserDefaults.standard.set(false, forKey: "appleHealth")
        }
        
    }
    
    func auth() -> Bool {
        
        let healthKitTypeToWrite: Set<HKSampleType> = [
            
            HKObjectType.workoutType()
            
        ]
        
        let healthKitTypeToRead: Set<HKObjectType> = []
        
        healthStore.requestAuthorization(toShare: healthKitTypeToWrite, read: healthKitTypeToRead) { (success, error) in
            
            print("auth success\(success) OR error\(String(describing: error))")
            
        }
        
        if !HKHealthStore.isHealthDataAvailable() {
            
            print("Error occured")
            return false
            
        }
        
        return true
    }
    
//    func localNotification() {
//
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            DispatchQueue.main.async {
//
//                if settings.authorizationStatus == .authorized {
//
//                    self.performSegue(withIdentifier: "toNotificationVC", sender: nil)
//
//                } else {
//
//                    self.performSegue(withIdentifier: "toBeforeNotificationVC", sender: nil)
//
//                }
//            }
//        }
//    }
    
}

// MARK: - UITableViewDelegate

extension SettingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath {
            
        case [0, 0]:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let informationVC = storyboard.instantiateViewController(withIdentifier:
                "InformationVC") as? InformationVC  else { return }
            
            self.show(informationVC, sender: nil)
            
        case [0, 1]:
            
             sendEmail()
        
        case [0, 2]:
            
            if #available( iOS 10.3, *) {SKStoreReviewController.requestReview()}
            
        case [0, 3]:
            
             notificationVCSwitch()
            
        default:
         
            print("not anyone")
        
        }
    }
}

extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        switch section {
            
        case 0: return Database.instance.getSettingArray().count
        case 1: return Database.instance.getSettingSwitchArray().count
        default: return 0
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        settingTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
 
        switch indexPath.section {
            
        case 0:
            guard let cell = settingTableView.dequeueReusableCell(withIdentifier: cellIdenfifierSettingCell)
                as? SettingCell else {return UITableViewCell()}
            
            let settingModeleArray = Database.instance.getSettingArray()[indexPath.row]
            settingTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            cell.selectionStyle = .none
            cell.updateView(settingModel: SettingCellModel(settingModel: settingModeleArray))
            
            return cell
            
        case 1:
            guard let cell = settingTableView.dequeueReusableCell(withIdentifier: cellIdenfifierSettingSwitchCell)
                as? SettingSwitchCell else {return UITableViewCell()}
            let settingSwitchModelArray = settingSwitchArray[indexPath.row]
            cell.updateView(settingModel: SettingSwitchCellModel(settingSwitchModel: settingSwitchModelArray))
            cell.selectionStyle = .none

            return cell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
    
}

extension SettingVC: MFMailComposeViewControllerDelegate {
    
    func configureMailController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mailComposerVC.setToRecipients(["wl02722691@gmail.com"])
        mailComposerVC.setSubject("App意見回饋")
        mailComposerVC.title = "意見回饋"
        
        return mailComposerVC
        
    }
    
    func sendEmail() {
        
        let mailComposeViewController = configureMailController()
        
        if MFMailComposeViewController.canSendMail() {
            
            self.present(mailComposeViewController, animated: true, completion: nil)
        
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    
    }
    
}
