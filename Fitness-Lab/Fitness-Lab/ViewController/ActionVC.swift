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

    func initList(category: FitnessCategory){
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


    //swiftlint:disable identifier_name
extension ActionVC: YouTubePlayerDelegate {

    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
        if playerState == .Playing{
            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                videoPlayer.pause()
                print("stop")
            }
        }
        
        if playerState == .Ended{
            print("完成之後跳這")
        }
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
    }
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        print("Player ready")
        activityIndicator.isHidden = true
        
        for i in 0...lists[selectSender].actionModel.count{
            print(i)
        }
      
        let doubleTime = Double(actionLists[0].restTime!) ?? 0
        
        let resttime = actionLists[0].restTime
        let time:TimeInterval = doubleTime
        
        
        videoView.play()
        let floatYoutubeTime = Float(actionLists[0].youtubeTime) ?? 0
        //videoPlayer.seekTo(floatYoutubeTime, seekAhead: true)
//        let resttime = actionLists[0].restTime
//        print(resttime!)
        
        
    
        
    }
}
