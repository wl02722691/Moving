//
//  ActionVC.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import YouTubePlayer_Swift
import AVFoundation

class ActionVC: UIViewController {
    var actionTimer: Timer?
    var actionSec = 30
    var restTimer: Timer?
    var restSec = 10
    var nowIndex = 0
    var firstTimeplay = true
    var actionTimerjustStop = false
    var restTimerjustStop = false
    var actionAnimatorWidth = UIViewPropertyAnimator()
    var restAnimatorWidth = UIViewPropertyAnimator()
    var contentInsetNumber = 0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var intensityLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var actionTableView: UITableView!
    
    var lists =  [ListModel]()
    var actionLists = [ActionModel]()
    var selectSender = 0
    
    func initList(category: FitnessCategory) {
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        actionTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        print(lists)
        print(actionLists)
        videoView.isHidden = true
        self.videoView.delegate = self
        activityIndicator.isHidden = true
        
        
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        videoView.isHidden = false
        videoView.playerVars = ["playsinline": 1 as AnyObject]
        videoView.loadVideoID(lists[selectSender].videoID)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    @objc func actionCountDown() {
        
        print("actionTimer?.timeInterval\(actionTimer?.timeInterval)")
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}

        actionSec -= 1
        if actionSec == 0 {
            actionTimer?.invalidate()
            actionSec = 0
            if nowIndex < actionLists.count-1 {
                cell.timeDescription.text = "✓"
                nowIndex += 1
                restViewWidthAnimate()
                print("nowIndex:\(nowIndex),\(actionLists.count-1)")
                restSec = Int(actionLists[nowIndex].restTime!)
                self.renewVideo()
                let indexPath = IndexPath(row: nowIndex, section: 0)
              
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil,
                                                      repeats: true)
        
                
                contentInsetNumber += 60
                print(contentInsetNumber)
                actionTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(contentInsetNumber), right: 0)
                  self.actionTableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
                print("休息時間！")
            } else {
                videoView.pause()
                print("做完囉要去下一頁了")
                performSegue(withIdentifier: "toScoreVC", sender: nil)
            }
        }
    }
    
    @objc func restCountDown() {
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        restSec -= 1
        cell.timeDescription.text = "0:\(restSec)"
        cell.actionDescription.text = "休息時間"
        if restSec == 0 {
            actionViewWidthAnimate()
            cell.actionDescription.text = actionLists[nowIndex].actionDescription
            restTimer?.invalidate()
            actionSec = Int(lists[selectSender].actionModel[nowIndex].timesDescription)
            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                    target: self,
                                                    selector: #selector(self.actionCountDown),
                                                    userInfo: nil, repeats: true)
        }
    }
    
    func renewVideo() {
        let floatYoutubeTime = Float(actionLists[nowIndex].youtubeTime)
        videoView.seekTo(floatYoutubeTime, seekAhead: true)
        let youtubestopTime = actionLists[nowIndex].stopTime
        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime!) {
            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime!) {
                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scoreVC = segue.destination as? ScoreVC {
            scoreVC.lists = lists
            scoreVC.actionLists = actionLists
            scoreVC.selectSender = selectSender
        }
    }
    
    func restViewWidthAnimate(){
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.progressView.isHidden = false
        print(actionLists[nowIndex].timesDescription)
        cell.progressView.frame = cell.bounds
        cell.progressView.frame.size.width = 0
        cell.progressView.backgroundColor = UIColor.gray
        
        restAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].restTime!, curve: .easeIn) {
            cell.progressView.frame.size.width = cell.frame.size.width
            
        }
        
        restAnimatorWidth.startAnimation()
       // colorLoopAnimation()
    }
    
    func colorLoopAnimation(){

        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}

        UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            cell.progressView.backgroundColor = #colorLiteral(red: 0.5254901961, green: 0.5607843137, blue: 0.5882352941, alpha: 1)
            cell.progressView.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3803921569, blue: 0.3921568627, alpha: 1)
        }, completion: nil)

    }
    
    
    func actionViewWidthAnimate() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.progressView.isHidden = false
        print(actionLists[nowIndex].timesDescription)
        print("cell.frame\(cell.frame),cell.bounds\(cell.bounds)")
        print("cell.progressView.frame\(cell.progressView.frame)cell.progressView.bounds\(cell.progressView.bounds),cell.progressView.frame.size.width\(cell.progressView.frame.size.width)")
        
 //       cell.progressView.frame = cell.frame

        cell.progressView.frame = cell.bounds
        cell.progressView.frame.size.width = 0
        cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.8901960784, blue: 0.3921568627, alpha: 1)
        
        actionAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].timesDescription, curve: .easeIn) {
            cell.progressView.frame.size.width = cell.frame.size.width
    
        }
    
        actionAnimatorWidth.startAnimation()

        /*
         let cellFrame = cell.frame
         
         let progressView = UIView(
         frame: CGRect(
         x: cellFrame.origin.x,
         y: cellFrame.origin.y,
         width: 0,
         height: cellFrame.size.height
         )
         )
         
         actionTableView.insertSubview(progressView, aboveSubview: cell)
         
         let animator = UIViewPropertyAnimator(duration: 20, curve: .easeIn) {
         
         progressView.frame.size.width = cell.frame.width
         
         }
         
         animator.startAnimation()
         */
    }

}

extension ActionVC: UITableViewDelegate {}

extension ActionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actionLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = actionTableView.dequeueReusableCell(withIdentifier: "ActionCell") as? ActionCell {
            
            actionSec = Int(lists[selectSender].actionModel[0].timesDescription)
            
            let listIndex = lists[selectSender]
            startBtn.clipsToBounds = true
            startBtn.layer.cornerRadius = 38
            videoTitle.text = listIndex.videoTitle
            videoImg.image = UIImage(named: listIndex.videoImg)
            intensityLbl.text = listIndex.intensity
            durationLbl.text = "\(listIndex.durationLbl)min"
            let actionlist = actionLists[indexPath.row]
            cell.updateView(actionModel: actionlist)
            cell.selectionStyle = .none
//            
//            if nowIndex == indexPath.row {
//                let allTime = Int(actionLists[nowIndex].timesDescription)
//                
//                print(allTime ?? 0 - actionSec)
//                print("allTime\(allTime),現在倒數\(allTime ?? 0 - actionSec)actionSec\(actionSec)")
//                let nowTime = allTime ?? 0 - actionSec
//                cell.timeDescription.text = "0:\(actionSec)"
//            }
//            
            return cell
            
        } else {
            
            return ActionCell()
        }
    }
}

extension ActionVC: YouTubePlayerDelegate {
    
    
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
    
        
        if playerState == .Playing {
            
            if firstTimeplay == true{
                firstTimePlay()
            }
            
                if actionTimer?.isValid == false && actionTimerjustStop == true{
                    actionAnimatorWidth.startAnimation()
                    actionTimerjustStop = false
                    self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                            target: self,
                                                            selector: #selector(self.actionCountDown),
                                                            userInfo: nil, repeats: true)
                }else if restTimer?.isValid == false && restTimerjustStop == true{
                    restAnimatorWidth.startAnimation()
                    restTimerjustStop = false
                    self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                            target: self,
                                                            selector: #selector(self.restCountDown),
                                                            userInfo: nil, repeats: true)
                }else{
                   
            }
        }
        
        if playerState == .Queued {
            
        }
        
        if playerState == .Paused {
            if actionTimer?.isValid == true{
                actionAnimatorWidth.pauseAnimation()
                
                actionTimer?.invalidate()
                actionTimerjustStop = true
            }else if restTimer?.isValid == true{
                restAnimatorWidth.pauseAnimation()
                
                  restTimer?.invalidate()
                restTimerjustStop = true
            }
        }
    }
    
    
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
    }
    
    func playerReady(_ videoPlayer: YouTubePlayerView){
            activityIndicator.isHidden = true
            let floatYoutubeTime = Float(actionLists[nowIndex].youtubeTime)
            videoPlayer.seekTo(floatYoutubeTime, seekAhead: true)
//            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
//                                                    target: self,
//                                                    selector: #selector(self.actionCountDown),
//                                                    userInfo: nil, repeats: true)
//
//            let youtubestopTime = actionLists[nowIndex].stopTime
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime!) {
//                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
//
//        }
    }
    
    func firstTimePlay() {
        
        self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                target: self,
                                                selector: #selector(self.actionCountDown),
                                                userInfo: nil, repeats: true)
        
        
        let youtubestopTime = actionLists[nowIndex].stopTime
        
        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime!) {
            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
            
        }
        
        actionViewWidthAnimate()
        
        firstTimeplay = false
    }
}
