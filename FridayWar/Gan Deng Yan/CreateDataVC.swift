//
//  CreateDataVC.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class CreateDataVC: UITableViewController {

    let onlineFriends = DataManager.shared.onlineFriends()
    var records: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Add"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))

        navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.tintColor = .black
        
        tableView.register(UINib(nibName: "CreateDataCell", bundle: nil), forCellReuseIdentifier: "CreateDataCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 72
    }
    
    @objc func doneButtonTapped() {
        
        if records.count + 1 != onlineFriends.count {
            print("wrong!")
        } else {
            
            dismiss(animated: true)
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
        cell.avatarImageView.image = UIImage(named: onlineFriends[indexPath.row])
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
        
    }
}
