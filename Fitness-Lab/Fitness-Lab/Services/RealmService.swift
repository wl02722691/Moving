//
//  RealmService.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService{
    
    private init(){}
    static let shared = RealmService()
    
    let realm = try? Realm()
   
    
    func create<T: Object>(_ object: T){
        do{
            try realm?.write{
                realm?.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do{
            try realm?.write {
                for (keykey, value) in dictionary{
                    object.setValue(value, forKey: keykey)
                }
            }
        }catch{
            post(error)
        }
        
    }
    
    func delete<T: Object>(_ object: T){
        do{
            try realm?.write {
                realm?.delete(object)
            }
        } catch {
            post(error)
        }
    }
    
    func post(_ error: Error){
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in viewController: UIViewController, completion: @escaping(Error?) -> Void){
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            completion(notification.object as? Error)
        }
    }
    
    func stopObservingErrors(in viewController: UIViewController){
        NotificationCenter.default.removeObserver(viewController, name: NSNotification.Name("RealmError"), object: nil)
    }
}
