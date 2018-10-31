//
//  ScoreVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/26.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase
import HealthKit

class ScoreVC: UIViewController {
    
    @IBOutlet weak var finishBtn: UIButton!
    @IBOutlet weak var scoreCollectionView: UICollectionView!
    var lists =  [ListModel]()
    var actionLists = [ActionModel]()
    var selectSender = 0
    let cellScaling: CGFloat = 0.6
    var didSelectItemAt = IndexPath(row: 0, section: 0)
    var scoreTitleLbl = "簡單"
    var time = 0.0
    var resttime = 0.0
    var resultTime = 0.0
    var healthkitConnect = true
    let healthStore: HKHealthStore = HKHealthStore()
    
// MARK: - initView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        scoreCollectionView.delegate = self
        scoreCollectionView.dataSource = self
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeigh = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeigh) / 2.0
        
        let layout = scoreCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: cellWidth, height: cellHeigh)
        scoreCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        finishBtn.cornerRadius = 25
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GAManager.createNormalScreenEventWith("ScoreVC")
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func notificationToSummaryVC() {
        
        let notificationName = Notification.Name("addNewData")
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["addNewData": "addNewData"])
        
    }
    
// MARK: - realm
    
    func realmWrite() {
        
        for actionlistsAllIndex in 0...actionLists.count-1 {
            time += actionLists[actionlistsAllIndex].timesDescription
            print("time:\(time)")
            resttime += (actionLists[actionlistsAllIndex].restTime)
            resultTime = time + resttime
        }
        
        let summaryModel = SummaryModel()
        summaryModel.videoImg = lists[selectSender].videoImg
        summaryModel.durationLbl = Int(resultTime)
        summaryModel.videoTitle = lists[selectSender].videoTitle
        summaryModel.scoreTitleLbl = scoreTitleLbl
        summaryModel.workoutDate = Date().timeIntervalSince1970
        
        RealmService.shared.create(summaryModel)
        
    }
    
// MARK: - healthKit
    
    func writeToKit() {
        
        let today = Date()
        
        let energyBurned = HKQuantity(unit: HKUnit.kilocalorie(),
                                      doubleValue: 425.0)
        
        let distance = HKQuantity(unit: HKUnit.mile(),
                                  doubleValue: 3.2)
        
        let workout = HKWorkout(activityType: HKWorkoutActivityType.traditionalStrengthTraining,
                                start: today as Date, end: today as Date, duration: resultTime,
                                totalEnergyBurned: energyBurned, totalDistance: distance, metadata: nil)
        
        healthStore.save(workout) { (success, _) -> Void in
            guard success else {
                
                print("*** An error occurred while saving")
                
                return
                
            }
            
            print("healthkit success \(success)")
        }
        
    }
    
    func loadAppleHealth() {
        
        if let appleHealthStatus = UserDefaults.standard.value(forKey: "appleHealth") as? Bool {
            
            if appleHealthStatus == true {
                
                writeToKit()
                
            }
        }
        
    }
    
    @IBAction func finishBtn(_ sender: UIButton) {
        
        Analytics.logEvent("ScoreVC_finishBtn", parameters: nil)
        
        navigationController?.navigationBar.isHidden = false
        
        realmWrite()
        
        loadAppleHealth()
        
        navigationController?.popToRootViewController(animated: true)
        
        let tabController = self.view.window?.rootViewController as? UITabBarController
        tabController?.dismiss(animated: true, completion: nil)
        
        tabController?.selectedIndex = 1
        
        let notificationName = Notification.Name("toSummaryVC")
        NotificationCenter.default.post(name: notificationName,
                                        object: nil,
                                        userInfo: ["updateRealm": "updateRealm"])
        
        notificationToSummaryVC()
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension ScoreVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Database.instance.getScoreArray().count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = scoreCollectionView.dequeueReusableCell(withReuseIdentifier: "scoreCell",
                                                              for: indexPath) as? ScoreCollectionViewCell {
            
            let scoreArray = Database.instance.getScoreArray()[indexPath.row]
            cell.updateView(scoreModel: scoreArray)
            if indexPath == didSelectItemAt {
                cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                cell.layer.borderWidth = 5
            } else {
                cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0)
                cell.layer.borderWidth = 0
            }
            return cell
            
        } else {
            
            return ScoreCollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ScoreVC: UICollectionViewDelegate, UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let layout = self.scoreCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let cellWidthncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthncludingSpacing
        let roundIndex = round(index)
        
        offset = CGPoint(x: roundIndex * cellWidthncludingSpacing - scrollView.contentInset.left,
                         y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        didSelectItemAt = indexPath
        
        guard let cell = self.scoreCollectionView.cellForItem(at: indexPath) as? ScoreCollectionViewCell  else {return}
        
        for otherRow in 0...Database.instance.getScoreArray().count {
            let otherIndexPath = IndexPath(row: otherRow, section: 0)
            let othrtCell = self.scoreCollectionView.cellForItem(at: otherIndexPath)
            othrtCell?.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0)
            othrtCell?.layer.borderWidth = 0
        }
        
        cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.layer.borderWidth = 5
        print(Database.instance.getScoreArray()[indexPath.row].titleLbl)
        
        scoreTitleLbl = Database.instance.getScoreArray()[indexPath.row].titleLbl
    }
}
