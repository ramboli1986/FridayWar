//
//  CreateDataVC.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class CreateDataVC: UITableViewController {

    let onlineFriends = DataManager.shared.onlineFriends()
    var userScores: [UserScore] = []
    var record: Record?
    
    let rootVC: GandengyanVC
    
    init(rootVC: GandengyanVC) {
        self.rootVC = rootVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Add"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))

        navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.tintColor = .black
        
        tableView.register(CreateDataCell.self, forCellReuseIdentifier: "CreateDataCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 72
        
        for friend in onlineFriends {
            userScores.append(UserScore(name: friend, score: 0))
        }
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
        
        updateRecord()
        
        if let record = record {
            var currentRecords = RecordDataManager.shared.retrieveRecords()
            currentRecords.append(record)
            RecordDataManager.shared.saveRecords(currentRecords)
            dismiss(animated: true) {
                self.rootVC.reloadAllData()
            }
        } else {
            let alertController = UIAlertController(
                title: "Error", // 设置标题
                message: "You need to fill in the scores for everyone except the winner; the winner's score will be tallied automatically.", // 设置内容
                preferredStyle: .alert // 设置样式为 alert
            )
            
            // 2. 创建 UIAlertAction
            let okAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil // 你可以在这里传入一个闭包来处理点击事件
            )
            
            // 将 UIAlertAction 添加到 UIAlertController 中
            alertController.addAction(okAction)
            
            // 3. 呈现 UIAlertController
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func updateRecord() {
        var winnerCount = 0
        var winnerScore = 0
        var winner = ""
        for userScore in userScores {
            if userScore.score == 0 {
                winnerCount += 1
                winner = userScore.name
            }
            winnerScore -= userScore.score
        }
        
        if winnerCount == 1 {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a" // "a" will print "am" or "pm"
            formatter.amSymbol = "am"
            formatter.pmSymbol = "pm"
            let dateString = formatter.string(from: now)
            
            var totalUserScores = RecordDataManager.shared.retrieveUserScores()
            for currentScore in userScores {
                for (index, totalScore) in totalUserScores.enumerated() {
                    if totalScore.name == currentScore.name {
                        if currentScore.name == winner {
                            let finalScore = totalScore.score + winnerScore
                            totalUserScores[index] = UserScore(name: totalScore.name, score: finalScore)
                        } else {
                            let finalScore = totalScore.score + currentScore.score
                            totalUserScores[index] = UserScore(name: totalScore.name, score: finalScore)
                        }
                        break
                    }
                }
            }
            RecordDataManager.shared.saveUserTotalScores(totalUserScores)
            
            userScores.removeAll { $0.name == winner }
            record = Record(time: dateString, winner: winner, winnerScore: winnerScore, others: userScores)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onlineFriends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateDataCell", for: indexPath) as! CreateDataCell
        cell.avatarImageView.image = AppResources.image(named: onlineFriends[indexPath.row])
        cell.nameLabel.text = onlineFriends[indexPath.row]
        cell.selectionStyle = .none
        cell.inputTextField.tag = indexPath.row
        cell.inputTextField.delegate = self
        if indexPath.row == 0 {
            cell.inputTextField.becomeFirstResponder()
        }
        return cell
    }
}

extension CreateDataVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = textField.tag
        let currentUser = onlineFriends[index]
        if let input = textField.text, let score = Int(input) {
            let score = UserScore(name: currentUser, score: -score)
            userScores[textField.tag] = score
        } else {
            let score = UserScore(name: currentUser, score: 0)
            userScores[textField.tag] = score
        }
    }
}
