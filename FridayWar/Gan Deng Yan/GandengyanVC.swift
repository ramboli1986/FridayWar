//
//  GandengyanVC.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit
import DGCharts
import SnapKit


struct Record {
    var time: String = ""
    var winner: String = ""
    var score: Int = 0
    var others: [(name:String, score:Int)] = []
    var totalPersons = 0
}

class GandengyanVC: UIViewController {

    let chartView = BarChartView()
    let tableView = UITableView()
    var records: [Record] = [
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)], totalPersons: 6),
        Record(time: "10.24pm", winner: "Bo", score: 10),
        Record(time: "10.24pm", winner: "Bo", score: 10),
        Record(time: "10.24pm", winner: "Bo", score: 10),
        Record(time: "10.24pm", winner: "Bo", score: 10),
        Record(time: "10.24pm", winner: "Bo", score: 10),
        Record(time: "10.24pm", winner: "Bo", score: 10)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(0.45 * view.frame.height)
        }
        let backButton = PlainImageTextButton(image: UIImage(systemName: "chevron.backward"), imageColor: .black)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "干瞪眼"
        
        let tableHeaderView = UIView()
        view.addSubview(tableHeaderView)
        tableHeaderView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(chartView.snp.bottom).offset(12)
            make.height.equalTo(44)
        }
        
        let noLabel = UILabel()
        noLabel.text = "No."
        let winnerLabel = UILabel()
        winnerLabel.text = "Winner"
        let timeLabel = UILabel()
        timeLabel.text = "Time"
        tableHeaderView.addSubview(noLabel)
        tableHeaderView.addSubview(winnerLabel)
        tableHeaderView.addSubview(timeLabel)
        
        noLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
        winnerLabel.snp.makeConstraints { make in
            make.leading.equalTo(noLabel.snp.trailing).offset(40)
            make.centerY.equalToSuperview()
        }
        timeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-44)
            make.centerY.equalToSuperview()
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(tableHeaderView.snp.bottom).offset(2)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tableView.register(UINib(nibName: "GandengyanCell", bundle: nil), forCellReuseIdentifier: "GandengyanCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 52
    }
    
    @objc func didTapBackButton() {
        dismiss(animated: true)
    }

}

extension GandengyanVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GandengyanCell", for: indexPath) as! GandengyanCell
        let record = records[indexPath.row]
        cell.record = record
        cell.numberLabel.text = String((records.count - indexPath.row))
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailScoreVC(record: records[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
