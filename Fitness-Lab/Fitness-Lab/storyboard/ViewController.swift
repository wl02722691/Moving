//
//  ViewController.swift
//  youtube
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import YouTubePlayer_Swift
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var videoView: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myWebView = WKWebView(frame: CGRect(x: 20, y: 20, width: view.frame.width, height: view.frame.height))
        myWebView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            myWebView.load(request)
       
        }
        }
    
    
    
    @IBAction func playBtn(_ sender: UIButton) {
        videoView.seekTo(115, seekAhead: true)
//        if sender.isSelected {
//            sender.setTitle("Pause", for: UIControlState.selected)
//            videoView.pause()
//
//        }else{
//            sender.setTitle("Pause", for: UIControlState.normal)
//            videoView.play()
//        }
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
         videoView.seekTo(180, seekAhead: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
//        videoView.nextVideo()
        videoView.seekTo(200, seekAhead: true)
       
    
    }
    
    @IBAction func loadVideoBtn(_ sender: Any) {
        videoView.playerVars = ["playsinline": 1 as AnyObject]
        videoView.loadVideoID("EIoryEvS2Gc")
        videoView.play()
//        videoView.seekTo(115, seekAhead: true)
        
         
        
    }
    
    @IBAction func loadPlaylistBtn(_ sender: Any) {
        
        let strListID:String = "PLJWw7I7wckZucMy0POmge1rEiGzttLY1B"
        videoView.loadVideoID(strListID)
        
    }
    
}
 

