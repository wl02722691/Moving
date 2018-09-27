//
//  SummaryModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class SummaryModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var myAge: Int = 0
//    private(set) public var listModel: [ListModel]
//    private(set) public var time: TimeInterval
//    private(set) public var picture: Data? = nil
//
//    init(listModel: [ListModel], time: TimeInterval, picture: Data?) {
//        self.listModel = listModel
//        self.time = time
//        self.picture = picture
//    }
}


