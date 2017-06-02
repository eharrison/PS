//
//  HistoryViewController.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/25/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit
import AwesomeData

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()
    var lastHour: Double = 0
    var sceneTimer: Timer?
    var dayTime = DayTime.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseHelper.messages({ (messages) in
            self.filterRead(messages: messages)
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HistoryViewController.scrollToLast), userInfo: nil, repeats: false)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        refreshScene()
    }
}

// MARK: - TableView Data source

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func scrollToLast(){
        if messages.count > 0 {
            self.tableView.scrollToRow(at: IndexPath(row: messages.count-1, section: 0), at: .bottom, animated: true)
        }
    }
    
    func filterRead(messages: [Message]) {
        var read = [Message]()
        
        #if Editor
            read.append(contentsOf: messages)
        #else
            for message in messages {
                if message.read {
                    read.append(message)
                }
            }
        #endif
        
        self.messages = read
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messages[indexPath.row].type.rawValue, for: indexPath)
        
        var dateFormatted = ""
        if let date = messages[indexPath.row].readAt?.toDate(format: "yyyy-MM-dd HH:mm") {
            dateFormatted = "\(date.toString(format: "MMM dd"))\n\(date.toString(format: "h:mma").lowercased())"
        }
        
        if let cell = cell as? MessageTableViewCell {
            cell.messageLabel.text = messages[indexPath.row].message
            cell.dateLabel.text = dateFormatted
        } else if let cell = cell as? ActionTableViewCell {
            cell.messageLabel.text = messages[indexPath.row].message
            cell.actionLabel.text = messages[indexPath.row].answer
            cell.dateLabel.text = dateFormatted
        } else if let cell = cell as? OptionsTableViewCell {
            cell.messageLabel.text = messages[indexPath.row].message
            cell.action1Button.setTitle(messages[indexPath.row].action1, for: .normal)
            cell.action2Button.setTitle(messages[indexPath.row].action2, for: .normal)
            
            cell.action1Button.isSelected = messages[indexPath.row].action1 == messages[indexPath.row].answer
            cell.action2Button.isSelected = messages[indexPath.row].action2 == messages[indexPath.row].answer
            
            cell.dateLabel.text = dateFormatted
        } else if let cell = cell as? InputTableViewCell {
            cell.titleLabel.text = messages[indexPath.row].message
            cell.answerLabel.text = messages[indexPath.row].answer
            cell.dateLabel.text = dateFormatted
        } else if let cell = cell as? ImageTableViewCell {
            cell.titleLabel.text = messages[indexPath.row].message
            cell.dateLabel.text = dateFormatted
            _ = cell.pictureImageView.setImage(messages[indexPath.row].imageUrl, completion: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

// MARK: -  Scene

extension HistoryViewController {
    
    func refreshScene() {
        
        //Current time
        let hour = Int(Date().toString(format: "HH")) ?? 8
        let minutes = Int(Date().toString(format: "mm")) ?? 0
        let time = Double(hour) + Double(minutes/60)
        
        //shooting stars
        if time < 7 || time > 18 {
            self.view.shootStar({
                Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(self.refreshScene), userInfo: nil, repeats: false)
            })
        }
        
        //if hour did not change, do not continue
        guard lastHour != Double(hour) else {
            return
        }
        
        lastHour = Double(hour)
        
        //change background color based on time
        let colorWithTime = UIColor.color(withHour: time)
        self.view.backgroundColor = colorWithTime
        
        // adds components based on time
        if time >= 7.5 && time <= 18 {
            if dayTime != .day {
                self.view.hideStar()
            }
            
            dayTime = .day
        } else {
            if dayTime != .night {
                self.view.showStars(count: 20)
            }
            
            dayTime = .night
        }
    }
    
}
