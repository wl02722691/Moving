//
//  NotificationVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/1.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import UserNotifications
import IQKeyboardManagerSwift

class NotificationVC: UIViewController {
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notificationTextView: UITextView!
    
    @IBAction func okBtn(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("User notifications are allowed.")
            } else {
                print("User notifications are not allowed.\(String(describing: error))")
            }
        }
        
        let dateHHValue = DateFormatter()
        dateHHValue.dateFormat = "HH"
        let hourString = dateHHValue.string(from: datePicker.date)
        print(hourString)
        
        let dateMMValue = DateFormatter()
        dateMMValue.dateFormat = "mm"
        let minString = dateMMValue.string(from: datePicker.date)
        print(minString)
        
        if notificationTextView.text == "" || notificationTextView!.text == "你想跟明天該運動的自己說什麼呢✍？"{
            scheduleNotification(hour: Int(hourString) ?? 0, minute: Int(minString) ?? 0, title: "Alice該運動囉！")
         } else {
            let titleText = notificationTextView.text
            scheduleNotification(hour: Int(hourString) ?? 0,
                                 minute: Int(minString) ?? 0,
                                 title: titleText ?? "Alice該運動囉！")
        }
        
        let notificationName = Notification.Name("notificationUpdate")
        NotificationCenter.default.post(name: notificationName,
                                        object: nil,
                                        userInfo: ["timeString": "\(hourString):\(minString)"])
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        okBtn.cornerRadius = 20
        datePicker.setValue(UIColor.white, forKey: "textColor")
        notificationTextView.layer.borderColor = UIColor.white.cgColor
        notificationTextView.layer.borderWidth = 1
        notificationTextView.clipsToBounds = true
        notificationTextView.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GAManager.createNormalScreenEventWith("NotificationVC")
        
        self.datePicker.datePickerMode = .time
        notificationTextView.delegate = self
        
    }
    
    func scheduleNotification(hour: Int, minute: Int, title: String) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = "胖仔饅頭4ni！"
        content.body = "該運動囉☺️"
        content.badge = 1
        //content.sound = UNNotificationSound(named: "gong")
        //let imageURL = Bundle.main.url(forResource: "YOYOYO", withExtension: "png")
        //let attachement = try! UNNotificationAttachment(identifier: "YOYOYO.png", url: imageURL!, options: nil)
        //content.attachments = [attachement]
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "eveydayNotification", content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request, withCompletionHandler: nil)
        
    }
}

extension NotificationVC: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        notificationTextView.text = ""
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
