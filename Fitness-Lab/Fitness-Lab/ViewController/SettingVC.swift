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

class SettingVC: UIViewController {
    
    @IBOutlet weak var tableViewSetting: UITableView!
    var settingArray = [SettingModel(titleLbl: "", statusLbl: "")]
    var cueToneStatus: CueTone = .open
    var settingSwitchArray = Data.instance.getSettingSwitchArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetting.delegate = self
        tableViewSetting.dataSource = self
        tableViewSetting.register(UINib(nibName: "SettingCell", bundle: nil),
                                  forCellReuseIdentifier: "SettingCell")
        tableViewSetting.register(UINib(nibName: "SettingSwitchCell", bundle: nil),
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
    }
    
    func loadNotificationTime() {
        if let notificationTime = UserDefaults.standard.value(forKey: "notificationtime") as? String {
            let indexPath = IndexPath(row: 3, section: 0)
            guard let cell = self.tableViewSetting.cellForRow(at: indexPath) as? SettingCell  else {return}
            cell.statusLbl.text = notificationTime
    
        }
    }
    
    @objc func notificationUpdate(noti: Notification) {
        let notificationTime = noti.userInfo!["timeString"] as? String
        let indexPath = IndexPath(row: 2, section: 0)
        guard let cell = self.tableViewSetting.cellForRow(at: indexPath) as? SettingCell  else {return}
        cell.statusLbl.text = notificationTime
        UserDefaults.standard.set(notificationTime, forKey: "notificationtime")
    }
    
    func cueTone() {
        
        let index = IndexPath(row: 0, section: 1)
        
        guard let cell = tableViewSetting.cellForRow(at: index) as? SettingSwitchCell else {return}
    
        cell.statusSwitch.addTarget(self, action: #selector(switchValueChange(mySwitch:)),
                                    for: UIControl.Event.valueChanged)
        
        if let cueToneStatus = UserDefaults.standard.value(forKey: "cueTone") as? Bool {
            
          cell.statusSwitch.setOn(cueToneStatus, animated: true)
        
        } else {
            
            cell.statusSwitch.setOn(true, animated: true)
            
        }

    }
    
    @objc func switchValueChange(mySwitch: UISwitch) {
        
        if mySwitch.isOn == true {
            
            let notificationName = Notification.Name("cueTone")
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["cueTone":true])
            UserDefaults.standard.set(true, forKey: "cueTone")
            
        } else {
            
            let notificationName = Notification.Name("cueTone")
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["cueTone": false])
            UserDefaults.standard.set(false, forKey: "cueTone")
        }
        
    }
}

extension SettingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let informationVC = storyboard.instantiateViewController(withIdentifier: "InformationVC") as? InformationVC  else { return }
            
            self.show(informationVC, sender: nil)
            
        case [0, 1]:
             sendEmail()
        case [0, 2]:
        
        
                UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                        DispatchQueue.main.async {
                            
                    if(settings.authorizationStatus == .authorized) {
                        
                        self.performSegue(withIdentifier: "toNotificationVC", sender: nil)
                        
                    } else {
                        
                        self.performSegue(withIdentifier: "toBeforeNotificationVC", sender: nil)
                        
                        }
                    }
                }
            
    
            
        case [0, 3]:
             print("[0, 3]!!")
        case [0, 4]:
            print("0, 4!!!")
        case [1, 0]:
            print("10!!!")
        case [1, 1]:
            print("11!!!")
        case [1, 2]:
            print("12!!!")
            
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
        case 0: return Data.instance.getSettingArray().count
        case 1: return Data.instance.getSettingSwitchArray().count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableViewSetting.separatorStyle = UITableViewCell.SeparatorStyle.none
        //let index = indexPath.row
        
        switch indexPath.section {
            
        case 0:
            guard let cell = tableViewSetting.dequeueReusableCell(withIdentifier: "SettingCell")
                as? SettingCell else {return UITableViewCell()}
            
            let settingArray = Data.instance.getSettingArray()[indexPath.row]
            tableViewSetting.separatorStyle = UITableViewCell.SeparatorStyle.none
            cell.selectionStyle = .none
            cell.updateView(settingModel: settingArray)
            
            return cell
            
        case 1:

            guard let cell = tableViewSetting.dequeueReusableCell(withIdentifier: "SettingSwitchCell")
                as? SettingSwitchCell else {return UITableViewCell()}
            cell.updateView(settingModel: settingSwitchArray[indexPath.row])
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
        
        mailComposerVC.setToRecipients(["wl02722691@gmail.com"])
        mailComposerVC.setSubject("App意見回饋")
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "無法寄送信件", message: "請再試一次", preferredStyle: UIAlertController.Style.alert)
        let dismiss = UIAlertAction(title: "確認", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func sendEmail() {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
        
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
