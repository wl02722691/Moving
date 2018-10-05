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
    var timerArray = [Date]()
    var lists =  [ListModel]()
    var actionLists = [ActionModel]()
    var selectSender = 0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var intensityLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var actionTableView: UITableView!
    
    // MARK: - initList
    func initList(category: FitnessCategory) {
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    // MARK: - initView
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        actionTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        print(lists)
        print(actionLists)
        videoView.isHidden = true
        self.videoView.delegate = self
        activityIndicator.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        startBtn.cornerRadius = 38
        let listIndex = lists[selectSender]
        videoTitle.text = listIndex.videoTitle
        videoImg.image = UIImage(named: listIndex.videoImg)
        intensityLbl.text = listIndex.intensity
        durationLbl.text = "\(listIndex.durationLbl)min"
        
    }
    

    @IBAction func playBtn(_ sender: UIButton) {
        
        videoView.isHidden = false
        videoView.playerVars = ["playsinline": 1 as AnyObject]
        videoView.loadVideoID(lists[selectSender].videoID)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    
    // MARK: - CountDown
    @objc func actionCountDown() {
        
        let date = Date()
        timerArray.append(actionTimer?.fireDate ?? date)
        
        let passSec = timerArray.count
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        
        let actionAllTimeSecInt = Int(actionLists[nowIndex].timesDescription)
        actionSec =  actionAllTimeSecInt - passSec
        cell.timeDescription.text = "0:\(actionSec)"
        
        actionLists[nowIndex].cellStatus = .playing
        actionLists[nowIndex].actionOrRest = .action
        
        if timerArray.count == actionAllTimeSecInt {
            //action倒數為0
            actionTimer?.invalidate()
            actionSec = 0
            
            if nowIndex < actionLists.count-1 {
                timerArray.removeAll()
                actionViewWidthAnimate()
                
                actionAnimatorWidth.stopAnimation(true)
                cell.timeDescription.text = "✓"
                cell.progressView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                actionLists[nowIndex].cellStatus = .played
                
                nowIndex += 1
                actionLists[nowIndex].cellStatus = .playing
                actionLists[nowIndex].actionOrRest = .rest
                
                restViewWidthAnimate()
            
                restSec = Int(actionLists[nowIndex].restTime!)
                self.renewVideo()
                let indexPath = IndexPath(row: nowIndex, section: 0)
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil,
                                                      repeats: true)
                
                contentInsetNumber += 60
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
    
    
    // MARK: - renewVideo
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
    
 
    // MARK: - Animate
    
    func colorLoopAnimation() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        
        UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            cell.progressView.backgroundColor = #colorLiteral(red: 0.5254901961, green: 0.5607843137, blue: 0.5882352941, alpha: 1)
            cell.progressView.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3803921569, blue: 0.3921568627, alpha: 1)
        }, completion: nil)
        
    }
    
    
    func actionViewWidthAnimate(progressViewWidth:Int) {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.progressView.isHidden = false
        
        cell.progressView.frame = cell.bounds
        cell.progressView.frame.size.width = 0
        cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.8901960784, blue: 0.3921568627, alpha: 1)
        
        actionAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].timesDescription, curve: .easeIn) {
            cell.progressView.frame.size.width = cell.frame.size.width
            
        }
        
        actionAnimatorWidth.startAnimation()
    }
    
    func restViewWidthAnimate() {
        
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

    }
    
    // MARK: - ToScoreVC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scoreVC = segue.destination as? ScoreVC {
            scoreVC.lists = lists
            scoreVC.actionLists = actionLists
            scoreVC.selectSender = selectSender
        }
    }
    
    
}

    // MARK: - UITableViewDelegate

extension ActionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let index = IndexPath(row: nowIndex, section: 0)
        guard let cell = actionTableView.cellForRow(at: index) as? ActionCell else {return}
        
      //  actionLists[nowIndex].progressWidth = Double(cell.progressView.frame.width)
      // Po cell.progressView.layer.presentation()!.bounds
        actionLists[nowIndex].progressWidth = Double(cell.progressView.layer.presentation()?.bounds.size.width ?? 0)
        
        
        print("actionLists[nowIndex].progressWidth\(actionLists[nowIndex].progressWidth)")
        
    }
}

    // MARK: - UITableViewDataSource

extension ActionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actionLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = actionTableView.dequeueReusableCell(withIdentifier: "ActionCell") as? ActionCell {
            cell.selectionStyle = .none
            
            let cellStatus = actionLists[indexPath.row].cellStatus
            let actionOrRest = actionLists[indexPath.row].actionOrRest
            
            if cellStatus == .playing  && actionOrRest == .action && videoView.playerState == .Playing {
                
            } else if cellStatus == .playing && actionOrRest == .action && videoView.playerState == .Paused {
                
                cell.progressView.isHidden = false
                cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.8901960784, blue: 0.3921568627, alpha: 1)
                cell.progressView.frame.size.width = CGFloat(actionLists[nowIndex].progressWidth)
                cell.timeDescription.text = "0:\(String(actionSec))"
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Playing {
                
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Paused {
                
                cell.progressView.isHidden = false
                cell.progressView.backgroundColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
                cell.progressView.frame.size.width = CGFloat(actionLists[nowIndex].progressWidth)
                cell.timeDescription.text = "0:\(String(restSec))"
                cell.actionDescription.text = "休息時間"
                
            } else if cellStatus == .played {
                
                
                cell.timeDescription.text = "✓"
                cell.progressView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
            } else if cellStatus == .willplay{
                
                let actionlistIndexRow = actionLists[indexPath.row]
                cell.updateView(actionModel: actionlistIndexRow)
                
            } else {
                
            }
            
            return cell
            
        } else {
            
            return ActionCell()
        }
    }
}

// MARK: - YouTubePlayerDelegate

extension ActionVC: YouTubePlayerDelegate {
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
        if playerState == .Playing {
            
            if firstTimeplay == true {
                firstTimePlay()
            }
            
            if actionTimer?.isValid == false && actionTimerjustStop == true {
                
                actionAnimatorWidth.startAnimation()
                actionTimerjustStop = false
                self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                        target: self,
                                                        selector: #selector(self.actionCountDown),
                                                        userInfo: nil, repeats: true)
                
            } else if restTimer?.isValid == false && restTimerjustStop == true {
                restAnimatorWidth.startAnimation()
                restTimerjustStop = false
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil, repeats: true)
            } else {
                
            }
        }
        
        if playerState == .Queued {
            
        }
        
        if playerState == .Paused {
            
            if actionTimer?.isValid == true {
                actionAnimatorWidth.pauseAnimation()
                
                actionTimer?.invalidate()
                actionTimerjustStop = true
                
            } else if restTimer?.isValid == true {
                
                restAnimatorWidth.pauseAnimation()
                
                restTimer?.invalidate()
                restTimerjustStop = true
            }
        }
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {}
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        
        activityIndicator.isHidden = true
        let floatYoutubeTime = Float(actionLists[nowIndex].youtubeTime)
        videoPlayer.seekTo(floatYoutubeTime, seekAhead: true)
        
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
