//
//  DataManager.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    let onlineFriendsKey = "OnLineList"
    let offlineFriendsKey = "OffLineList"
    let defaultFriends = ["Amber", "Cindy", "Tracy", "Bo", "Bochuan", "Xing"]
    
    private init() {}
    
    // 每次启动检查是否有list 没有的话更新为默认list
    func updateDefaultFriendListIfNeeded() {
        if onlineFriends().count == 0 {
            // 更新为默认值
            UserDefaults.standard.set(defaultFriends, forKey: onlineFriendsKey)
        }
    }
    
    func online(name: String) {
        var offlineList = offlineFriends()
        offlineList = offlineList.filter( { $0 != name })
        
        UserDefaults.standard.set(offlineList, forKey: offlineFriendsKey)
        
        var onlineList = onlineFriends()
        onlineList.insert(name, at: 0)
        
        UserDefaults.standard.set(onlineList, forKey: onlineFriendsKey)
    }
    
    func offline(name: String) {
        
        var onlineList = onlineFriends()
        onlineList = onlineList.filter( { $0 != name })
        
        UserDefaults.standard.set(onlineList, forKey: onlineFriendsKey)
        
        var offlineList = offlineFriends()
        offlineList.insert(name, at: 0)
        
        UserDefaults.standard.set(offlineList, forKey: offlineFriendsKey)
    }
    
    func onlineFriends() -> [String] {
        return UserDefaults.standard.array(forKey: onlineFriendsKey) as? [String] ?? []
    }
    
    func offlineFriends() -> [String] {
        return UserDefaults.standard.array(forKey: offlineFriendsKey) as? [String] ?? []
    }
}
