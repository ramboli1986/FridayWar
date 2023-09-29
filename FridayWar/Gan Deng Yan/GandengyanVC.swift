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
}

class GandengyanVC: UIViewController {
    
    let chartView = BarChartView()
    let tableView = UITableView()
    var records: [Record] = [
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)]),
        Record(time: "10.24pm", winner: "Bo", score: 10, others: [("Tracy", 10), ("Amber", 12), ("Cindy", 20), ("Bochuan", 10), ("Xing", 10)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.45 * view.frame.height)
            make.top.equalToSuperview().offset(84)
        }
        
        chartView.pinchZoomEnabled = false
        chartView.highlightFullBarEnabled = false
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
        
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: DataManager.shared.onlineFriends())
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        
        setupChartData()
        
        let backButton = PlainImageTextButton(image: UIImage(systemName: "chevron.down"), imageColor: .black)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "干瞪眼"
        let winnerButton = PlainImageTextButton(image: UIImage(systemName: "chart.line.uptrend.xyaxis"), imageColor: .black)
        winnerButton.addTarget(self, action: #selector(didTapWinnerButton), for: .touchUpInside)
        
        let addButton = PlainImageTextButton(image: UIImage(systemName: "plus"), imageColor: .black)
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        addButton.backgroundColor = UIColor(red: 251/255, green: 213/255, blue: 0, alpha: 1)
        addButton.layer.cornerRadius = 27
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addButton.layer.shadowRadius = 4
        addButton.layer.shadowOpacity = 0.5
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: winnerButton)
        
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
            make.bottom.equalToSuperview()
        }
        
        tableView.register(UINib(nibName: "GandengyanCell", bundle: nil), forCellReuseIdentifier: "GandengyanCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 52
        
        view.addSubview(addButton)
        
        view.bringSubviewToFront(addButton)
        
        addButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16) // 下边距为16
            make.width.height.equalTo(54) // 宽度和高度为64
        }
    }
    
    @objc func didTapBackButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapWinnerButton() {
        let alertController = UIAlertController(
            title: "今晚卷王是:", // 设置标题
            message: "", // 设置内容
            preferredStyle: .alert // 设置样式为 alert
        )
        
        let attributedString = NSMutableAttributedString(
            string: "\nAmber\n",
            attributes: [
                // 设置字体和大小
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .bold),
                // 设置颜色
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        )
        
        // 将 attributedMessage 设置为我们刚刚创建的富文本字符串
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        // 2. 创建 UIAlertAction
        let okAction = UIAlertAction(
            title: "Got it",
            style: .default,
            handler: nil // 你可以在这里传入一个闭包来处理点击事件
        )
        
        // 将 UIAlertAction 添加到 UIAlertController 中
        alertController.addAction(okAction)
        
        // 3. 呈现 UIAlertController
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func didTapAddButton() {
        let createVC = UPNavigationViewController(rootViewController: CreateDataVC())
        present(createVC, animated: true)
    }
    
    func setupChartData() {
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 11)
        
        
        let yVals  = [
            BarChartDataEntry(x: 0.0, y: -23),
            BarChartDataEntry(x: 1.0, y: -43),
            BarChartDataEntry(x: 2.0, y: 14),
            BarChartDataEntry(x: 3.0, y: 12),
            BarChartDataEntry(x: 4.0, y: 56),
            BarChartDataEntry(x: 5.0, y: -23)
        ]
        
        let dataSet: BarChartDataSet! = BarChartDataSet(entries: yVals, label: "Friends")
        dataSet.valueFont = .systemFont(ofSize: 12, weight: .medium)
        dataSet.colors = [
            UIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1.0),
            UIColor(red: 241/255.0, green: 196/255.0, blue: 115/255.0, alpha: 1.0),
            UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0),
            UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1.0),
            UIColor(red: 0.063, green: 0.733, blue: 0.812, alpha: 1.0),
            UIColor(red: 250/255.0, green: 201/255.0, blue: 0/255.0, alpha: 1.0)
        ]
        
        let barData = BarChartData(dataSet: dataSet)
        barData.barWidth = 0.8
        
        chartView.data = barData
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
