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
import Lottie

//swiftlint:disable force_cast
class ActionVC: UIViewController {
    
    @IBOutlet weak var reconnectBtn: UIButton!
    var actionTimer: Timer?
    var actionSec = 300
    var restTimer: Timer?
    var restSec = 100
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
    var cueTone: AVAudioPlayer!
    var cueToneStatus: CueTone = .open
    var synthesizer = AVSpeechSynthesizer()
    var reachability = Reachability(hostName: "www.apple.com")
    var animationView = LOTAnimationView()
    @IBOutlet weak var connectView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var intensityLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var actionTableView: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       
        videoView.pause()
        animationView.removeFromSuperview()
        
    }
    
    // MARK: - initList
    func initList(category: FitnessCategory) {
        lists = Data.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    // MARK: - initView
    override func viewDidLoad() {
        super.viewDidLoad()
        actionTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        print(lists)
        print(actionLists)
        videoView.isHidden = true
        self.videoView.delegate = self
        activityIndicator.isHidden = true
        initCueTone()
        
        let notificationName = Notification.Name("cueTone")
        NotificationCenter.default.addObserver(self, selector: #selector(cueToneUpdate(noti:)), name: notificationName, object: nil)
        
    }
    
    @objc func cueToneUpdate(noti: Notification) {
    
        guard let status = noti.userInfo!["cueTone"] as? Bool else { return }

        if status == true {
            cueToneStatus = .open
        } else {
            cueToneStatus = .close
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        GAManager.createNormalScreenEventWith("ActionVC")
        startBtn.cornerRadius = 38
        let listIndex = lists[selectSender]
        videoTitle.text = listIndex.videoTitle
        videoImg.image = UIImage(named: listIndex.videoImg)
        intensityLbl.text = listIndex.intensity
        durationLbl.text = "\(listIndex.durationLbl)min"
        
        let index = IndexPath(row: nowIndex, section: 0)
        actionTableView.reloadRows(at: [index], with: UITableView.RowAnimation.automatic)
        
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        
        if downloadData() == true {
            
            videoView.isHidden = false
            videoView.playerVars = ["playsinline": 1 as AnyObject]
            videoView.loadVideoID(lists[selectSender].videoID)
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
            
        } else {
            
      
            print(" downloadData() == false ")
        }
        
    }
    
    // MARK: - CountDownReloadView
    
    func actionCountDownReloadCellView() {
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.timeDescription.text = "\(actionSec)"
        print("actionSec\(actionSec)")
        cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
        
    }
    
    func actionCountDownToZeroReloadCellView() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.progressView.frame.size.width = cell.frame.size.width
        cell.progressView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let contentInsetHeight = Int(actionTableView.frame.height - cell.frame.height)
        if contentInsetNumber < contentInsetHeight {
            contentInsetNumber += contentInsetHeight
            actionTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(contentInsetNumber), right: 0)
            print("contentInsetNumber\(contentInsetNumber)")
        }
        
        self.actionTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
        if cueToneStatus == CueTone.open {
            cueTone.play()
        }
    }
    
    func restCountDownReloadCellView() {
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.timeDescription.text = "\(restSec)"
        cell.actionDescription.text = "休息時間"
    }
    
    func restCountDownToZeroReloadCellView() {
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
        cell.actionDescription.text = actionLists[nowIndex].actionDescription
        if cueToneStatus == CueTone.open {
            cueTone.play()
            sayActionDescription()
        }
    }
    
    // MARK: - CountDown
    @objc func actionCountDown() {
        //第一次play要renew秒數
        
        actionLists[nowIndex].cellStatus = .playing
        actionLists[nowIndex].actionOrRest = .action
        
        actionCountDownReloadCellView()
        
        actionSec -= 1
        
        if actionSec <= 0 {
            
            actionTimer?.invalidate()
            
            if nowIndex < actionLists.count-1 {
                
                actionAnimatorWidth.stopAnimation(true)
                
                actionLists[nowIndex].cellStatus = .played
                
                nowIndex += 1
                
                actionLists[nowIndex].cellStatus = .playing
                actionLists[nowIndex].actionOrRest = .rest
                
                actionCountDownToZeroReloadCellView()
                //改狀態
                
                //更新restSec初始值
                if actionLists[nowIndex].firstPlayRest == true {
                    restSec = Int(actionLists[nowIndex].restTime)
                    actionLists[nowIndex].firstPlayRest = false
                    print(restSec)
                }
                
                //更新restSec的View
                restViewWidthAnimate(cell: nil)
                
                //換下一個動作
                self.renewVideo()
                
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil,
                                                      repeats: true)
                
                print("休息時間！")
                
            } else {
                videoView.pause()
                print("做完囉要去下一頁了")
                performSegue(withIdentifier: "toScoreVC", sender: nil)
            }
        }
    }
    
    @objc func restCountDown() {
        
        restSec -= 1
        
        print("restSec\(restSec)")
        
        restCountDownReloadCellView()
        
        if restSec <= 0 {
            
            if actionLists[nowIndex].firstPlayAction == true {
                actionSec = Int(actionLists[nowIndex].timesDescription)
                
                actionLists[nowIndex].firstPlayAction = false
            }
            
            actionViewWidthAnimate(cell: nil)
            restCountDownToZeroReloadCellView()
            restTimer?.invalidate()
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
        
        let compareIndex = nowIndex
        print("compareIndex\(compareIndex)nowIndex\(nowIndex)")
        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
            if compareIndex == self.nowIndex {
                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                    if compareIndex == self.nowIndex {
                        self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                            if compareIndex == self.nowIndex {
                                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Animate
    
    func actionViewWidthAnimate(cell: ActionCell?) {
        
        if Int(actionLists[nowIndex].timesDescription) == actionSec {
            //總秒數=現在的秒數，
            let indexPath = IndexPath(row: nowIndex, section: 0)
            guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
            cell.progressView.frame = cell.bounds
            cell.progressView.frame.size.width = 0
            actionAnimatorWidth = UIViewPropertyAnimator(duration:actionLists[nowIndex].timesDescription,
                                                         curve: .easeIn) {
                                                            cell.progressView.frame.size.width = cell.frame.size.width
            }
            
        } else {
            
            guard let cell = cell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
            
            let timesDescription = actionLists[nowIndex].timesDescription
            let proportion =  1 - (Double(actionSec) / timesDescription)
            
            let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
            print(progressViewWidthProportion)
            
            cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
            actionAnimatorWidth = UIViewPropertyAnimator(duration: TimeInterval(actionSec), curve: .easeIn) {
                cell.progressView.frame.size.width = cell.frame.size.width
            }
        }
        
        actionAnimatorWidth.startAnimation()
        
    }
    
    func restViewWidthAnimate(cell: ActionCell?) {
        
        if Int(actionLists[nowIndex].restTime) == restSec {
            let indexPath = IndexPath(row: nowIndex, section: 0)
            guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionCell  else {return}
            cell.progressView.isHidden = false
            print(actionLists[nowIndex].timesDescription)
            cell.progressView.frame = cell.bounds
            cell.progressView.frame.size.width = 0
            cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
            restAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].restTime, curve: .easeIn) {
                cell.progressView.frame.size.width = cell.frame.size.width
            }
        } else {
            guard let cell = cell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
            let restTimesDescription = actionLists[nowIndex].restTime
            let proportion =  1 - (Double(restSec) / restTimesDescription)
            
            let progressViewWidthProportion: Double = Double(cell.frame.size.width) * proportion
            print(Double(cell.frame.size.width) * proportion)
            print(progressViewWidthProportion)
            
            cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
            restAnimatorWidth = UIViewPropertyAnimator(duration: TimeInterval(restSec), curve: .easeIn) {
                cell.progressView.frame.size.width = cell.frame.size.width
            }
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
    
    // MARK: - CueTone
    func initCueTone(){
        let soundPath = Bundle.main.url(forResource: "Wate", withExtension: "wav")
        do {
            self.cueTone = try AVAudioPlayer(contentsOf: soundPath!)
            self.cueTone.prepareToPlay()
        } catch {
            print("error")
        }

    }
    
    func sayActionDescription() {
        
        let utterance = AVSpeechUtterance(string: actionLists[nowIndex].actionDescription)
        utterance.voice =  AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(utterance)
    }
    
    
    //checkInternetFunction downloadData
    
    func checkInternetFunction() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            print("no internet connected.")
            return false
        }else {
            print("internet connected successfully.")
            return true
        }
    }
    
    func downloadData() -> Bool{
        
        if checkInternetFunction() == true {
            downloadDataViewTrue()
            
            return true
            
        }else {
            
            print("checkInternetFunction() == false")
            downloadDataViewFalse()
            
            return false
        }
    }
    
    func downloadDataViewTrue(){
        
        connectView.isHidden = true
        
 
    }
    
    func downloadDataViewFalse() {
        
        connectView.isHidden = false
        animationView = LOTAnimationView(name: "green_circle")
        reconnectBtn.cornerRadius = 25
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = CGPoint(x: self.view.center.x, y: self.view.center.y-120)
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = true
        animationView.play()
        
        if self.connectView.subviews.count == 3 {
            self.connectView.addSubview(animationView)
        }
    }
    
    @IBAction func reconnectBtnWasPressed(_ sender: UIButton) {
        downloadData()
    }
    
}

// MARK: - UITableViewDelegate

extension ActionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let this = actionLists.count - nowIndex
        guard let cell = actionTableView.cellForRow(at: indexPath) else {return}
        let mostContentInsetHeight = Int(actionTableView.frame.height - cell.frame.height)
        var eachContentInsetHeight = 0
        
        if Int(actionTableView.frame.height) > this * Int(cell.frame.height) {
            
            eachContentInsetHeight = Int(actionTableView.frame.height) - this * Int(cell.frame.height)
            
        }
        
        if indexPath.row == nowIndex {
            //按正在播放的按鈕
            if actionLists[nowIndex].playingOrPause == .playing {
                
                videoView.pause()
                actionTableView.reloadData()
                
            } else {
                
                videoView.play()
                actionTableView.reloadData()
                
            }
        } else if indexPath.row > nowIndex {
            //按之後的按鈕
            guard videoView.playerState == .Playing else {return}
            for cell in 0 ..< indexPath.row {
                actionLists[cell].cellStatus = .played
            }
            
            self.actionTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
            
            nowIndex = indexPath.row
            
            actionSec = Int(actionLists[nowIndex].timesDescription)
            
            if actionTimer != nil {
                actionTimer?.invalidate()
            }
            
            if actionTimer != nil {
                restTimer?.invalidate()
            }
            
            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                    target: self,
                                                    selector: #selector(self.actionCountDown),
                                                    userInfo: nil, repeats: true)
            
            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
            
            let youtubestopTime = actionLists[nowIndex].stopTime
            
            let compareIndex = nowIndex
            
            DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                if compareIndex == self.nowIndex {
                    self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                        if compareIndex == self.nowIndex {
                            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                            
                        }
                    }
                    
                }
            }
            
            actionViewWidthAnimate(cell: nil)
            
        } else if indexPath.row < nowIndex {
            
            guard videoView.playerState == .Playing else {return}
            //把indexPath.row 到 nowIndex 中間的變成willplay
            for cell in indexPath.row ... nowIndex {
                actionLists[cell].cellStatus = .willplay
            }
            actionLists[nowIndex].firstPlayRest = true
            actionLists[nowIndex].firstPlayAction = true
            actionLists[nowIndex].actionCellDidInvisiable = false
            actionLists[nowIndex].restCellDidInvisiable = false
            
            nowIndex = indexPath.row
            actionTableView.reloadData()
            
            if actionTimer != nil {
                actionTimer?.invalidate()
            }
            
            if actionTimer != nil {
                restTimer?.invalidate()
            }
            
            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                    target: self,
                                                    selector: #selector(self.actionCountDown),
                                                    userInfo: nil, repeats: true)
            
            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
            
            let youtubestopTime = actionLists[nowIndex].stopTime
            
            let compareIndex = nowIndex
            
            DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                
                if compareIndex == self.nowIndex {
                    
                        self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                        if compareIndex == self.nowIndex {
                            self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                            
                        }
                    }
                }
                
            }
            
            actionSec = Int(actionLists[nowIndex].timesDescription)
            
            actionViewWidthAnimate(cell: nil)
            
        }
        
        if contentInsetNumber < mostContentInsetHeight && videoView.playerState == .Playing  {
            contentInsetNumber += eachContentInsetHeight
            actionTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(contentInsetNumber), right: 0)
            print("nowIndex\(nowIndex)eachContentInsetHeight\(eachContentInsetHeight)this\(this)")
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellStatus = actionLists[indexPath.row].cellStatus
        let actionOrRest = actionLists[indexPath.row].actionOrRest
        
        guard let playingCell = cell as? ActionCell else {return}
        
        if cellStatus == .playing  && actionOrRest == .action && videoView.playerState == .Playing {
            actionViewWidthAnimate(cell: playingCell)
            
        } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Playing {
            restViewWidthAnimate(cell: playingCell)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
}

// MARK: - UITableViewDataSource

extension ActionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actionLists.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = actionTableView.dequeueReusableCell(withIdentifier: "ActionCell") as? ActionCell {
            cell.selectionStyle = .none
            
            let cellStatus = actionLists[indexPath.row].cellStatus
            let actionOrRest = actionLists[indexPath.row].actionOrRest
            
            if cellStatus == .playing  && actionOrRest == .action && videoView.playerState == .Playing {
                if actionTimer == nil {
                    self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                            target: self,
                                                            selector: #selector(self.actionCountDown),
                                                            userInfo: nil, repeats: true)
                }
                
                actionViewWidthAnimate(cell: nil)
                cell.timeDescription.text = String(actionSec)
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.actionDescription.text = actionLists[nowIndex].actionDescription
            } else if cellStatus == .playing && actionOrRest == .action && videoView.playerState == .Paused {
                
                let actionTimesDescription = actionLists[nowIndex].timesDescription
                let proportion =  1 - (Double(actionSec) / actionTimesDescription)
                let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
                cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
                cell.progressView.isHidden = false
                cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
                cell.timeDescription.text = "\(actionSec)"
                cell.actionDescription.text = actionLists[nowIndex].actionDescription
                actionLists[nowIndex].actionCellDidInvisiable = true
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Playing {
                cell.timeDescription.text = String(restSec)
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Paused {
                
                cell.progressView.isHidden = false
                let restTimesDescription = actionLists[nowIndex].restTime
                let proportion =  1 - (Double(restSec) / restTimesDescription)
                let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
                cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
                cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                cell.timeDescription.text = "\(restSec)"
                cell.actionDescription.text = "休息時間"
                actionLists[nowIndex].restCellDidInvisiable = true
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .played {
                
                cell.progressView.isHidden = false
                cell.progressView.frame.size.width = cell.frame.size.width
                cell.timeDescription.text = "✓"
                cell.actionDescription.text = actionLists[indexPath.row].actionDescription
                cell.progressView.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
                cell.actionDescription.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                
            } else if cellStatus == .willplay {
                
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView,
                            playerState: YouTubePlayerState) {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        
        guard let cell = actionTableView.cellForRow(at: indexPath) as? ActionCell else {return}
        
        if playerState == .Playing {
            
            actionLists[nowIndex].playingOrPause = .playing
            
            if firstTimeplay == true {
                let indexPath = IndexPath(row: nowIndex, section: 0)
                self.actionTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
                firstTimePlay()
                
            }
            
            if actionTimer?.isValid == false && actionTimerjustStop == true {
                
                actionTimerjustStop = false
                
                self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                        target: self,
                                                        selector: #selector(self.actionCountDown),
                                                        userInfo: nil, repeats: true)
                
                //有進過cellForRow的
                if actionLists[nowIndex].actionCellDidInvisiable == true {
                    
                    actionViewWidthAnimate(cell: cell)
                    
                } else {
                    
                    //普通的
                    actionAnimatorWidth.startAnimation()
                }
                
            } else if restTimer?.isValid == false && restTimerjustStop == true {
                
                restTimerjustStop = false
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil, repeats: true)
                
                //有進過cellForRow的
                
                if actionLists[nowIndex].restCellDidInvisiable == true {
                    restViewWidthAnimate(cell: cell)
                } else {
                    //普通的
                    restAnimatorWidth.startAnimation()
                }
                
            } else {
                
            }
        }
        
        if playerState == .Buffering {
            
            videoPlayer.pause()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                videoPlayer.play()
            }
        }
        
        if playerState == .Queued {
            
        }
        
        if playerState == .Paused {
            
            actionLists[nowIndex].playingOrPause = .pause
            
            let index = IndexPath(row: nowIndex, section: 0)
            
            guard let cell = actionTableView.cellForRow(at: index) as? ActionCell else {return}
            
            if actionTimer?.isValid == true {
                //現在是action
                
                actionTimerjustStop = true
                
                actionTimer?.invalidate()
                
                actionAnimatorWidth.pauseAnimation()
                
                cell.progressView.isHidden = false
                
            } else if restTimer?.isValid == true {
                //現在是rest
                restTimerjustStop = true
                
                restTimer?.invalidate()
                
                restAnimatorWidth.pauseAnimation()
                
                cell.progressView.isHidden = false
                
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
        
        let compareIndex = nowIndex
        
        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
            
            if compareIndex == self.nowIndex {
                
                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                    
                    if compareIndex == self.nowIndex {
                        self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                        
                    }
                }
                
            } else {
                
            }
        }
        
        actionSec = Int(actionLists[nowIndex].timesDescription)
        
        actionViewWidthAnimate(cell: nil)
        
        firstTimeplay = false
        
    }
}
