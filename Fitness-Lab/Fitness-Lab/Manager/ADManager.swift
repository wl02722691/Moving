//
//  ADManager.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/13.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import GoogleMobileAds

class ADMAnager {
    
    static func addAd(bannerView: GADBannerView, adUnitID: String, rootViewController: UIViewController) {
        
        let request = GADRequest()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = rootViewController
        bannerView.load(request)
        
    }
}
