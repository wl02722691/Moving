//
//  FirebaseManager.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/18.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    
    var reference: DatabaseReference!
    
    init() {
        reference = Database.database().reference()
    }
    
    static let instance = FirebaseManager()
    
    var alllistModelFromFirebase = [NewListModel]()
    var absListModelFromFirebase = [NewListModel]()
    var legListModelFromFirebase = [NewListModel]()
    var armListModelFromFirebase = [NewListModel]()
    
    func getNoQuery(
        path: String,
        event: FirebaseEventType,
        success: @escaping (Any) -> Void,
        failure: @escaping (Error) -> Void
        ) {
        
        reference.child(path).observeSingleEvent(of: event.eventType(), with: { snapshot in
            
            guard let value = snapshot.value else {
                
                return
            }
            
            success(value)
        })
    }
    
    func updateData (
        path: String,
        event: FirebaseEventType,
        value: [String: Any]) {
        
        reference.child(path).setValue(value)
        
    }
    
    func getQuery(category: Category) {
        reference.child("allAction").queryOrdered(byChild: "category").queryEqual(toValue:
            category.rawValue).observeSingleEvent(of: .value) { (snapshot) in
            
            guard let value = snapshot.value else { return }
            
            do {
                
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                
                print(jsonData)
                
                let query = try JSONDecoder().decode(ListModel.self, from: jsonData)
                print(query)
                
            } catch {
                
                print(error)
                
            }
        }
    }
    
    func dataFilter(newListModel: [NewListModel]) {
        
        for eachListModel in newListModel {
            
            switch eachListModel.category {
            case .abs:
                absListModelFromFirebase.append(eachListModel)
            case .leg:
                legListModelFromFirebase.append(eachListModel)
            case .arm:
                armListModelFromFirebase.append(eachListModel)
            }
        }
    }
    
    func loadData(address: String) {
        
        reference.child(address).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let value = snapshot.value else { return }
            
            do {
                
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                print(jsonData)
                self.alllistModelFromFirebase = try JSONDecoder().decode([NewListModel].self, from: jsonData)
                
                print(self.alllistModelFromFirebase)
                
                self.dataFilter(newListModel: self.alllistModelFromFirebase)
                
            } catch {
                print(error)
                
            }
            
        })
    }
    
    func getList(forListTitle title: String) -> [NewListModel] {
        switch title {
        case "Core Workout":
            return getCore()
        case "Abs Workout":
            return getAbs()
        case "Arm Workout":
            return getArm()
        case "Leg Workout":
            return getLeg()
            
        default:
            return getCore()
        }
    }
    
    func getCore() -> [NewListModel] {
        return alllistModelFromFirebase
    }
    
    func getAbs() -> [NewListModel] {
        return absListModelFromFirebase
    }
    
    func getArm() -> [NewListModel] {
        return armListModelFromFirebase
    }
    
    func getLeg() -> [NewListModel] {
        return legListModelFromFirebase
    }
    
}

enum FirebaseEventType {
    
    case create
    
    case read
    
    case update
    
    case delete
    
    func eventType() -> DataEventType {
        
        switch self {
            
        case .create:
            print(FirebaseEventType.create)
        case .read:
            print(FirebaseEventType.read)
        case .update:
            print(FirebaseEventType.update)
        case .delete:
            print(FirebaseEventType.delete)
        }
        
        return DataEventType.value
    }
}
