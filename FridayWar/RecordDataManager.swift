//
//  RecordDataManager.swift
//  FridayWar
//
//  Created by bo LI on 9/29/23.
//

import Foundation

struct UserScore: Codable {
    var name: String
    var score: Int
}

struct Record: Codable {
    var time: String = ""
    var winner: String = ""
    var winnerScore: Int = 0
    var others: [UserScore] = []
}

class RecordDataManager {
    static let shared = RecordDataManager()
    private let userDefaults = UserDefaults.standard
    private let recordsKey = "recordsKey"
    private let userScoresKey = "userScoresKey"
    
    func saveRecords(_ records: [Record]) {
        do {
            let data = try JSONEncoder().encode(records)
            userDefaults.set(data, forKey: recordsKey)
        } catch {
            print("Error encoding Records: \(error)")
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = userDefaults.data(forKey: recordsKey) else {
            return []
        }
        
        do {
            let records = try JSONDecoder().decode([Record].self, from: data)
            return records.reversed()
        } catch {
            print("Error decoding Records: \(error)")
            return []
        }
    }
    
    func saveUserTotalScores(_ userScores: [UserScore]) {
        do {
            let data = try JSONEncoder().encode(userScores)
            userDefaults.set(data, forKey: userScoresKey)
        } catch {
            print("Error encoding Records: \(error)")
        }
    }
    
    func retrieveUserScores() -> [UserScore] {
        guard let data = userDefaults.data(forKey: userScoresKey) else {
            var scores: [UserScore] = []
            for friend in DataManager.shared.onlineFriends() {
                scores.append(UserScore(name: friend, score: 0))
            }
            
            for friend in DataManager.shared.offlineFriends() {
                scores.append(UserScore(name: friend, score: 0))
            }
            
            return scores
        }
        
        do {
            let userScores = try JSONDecoder().decode([UserScore].self, from: data)
            return userScores
        } catch {
            print("Error decoding UserScores: \(error)")
            return []
        }
    }
    
    func cleanUpAllRecords() {
        userDefaults.removeObject(forKey: recordsKey)
        userDefaults.removeObject(forKey: userScoresKey)
    }
}
