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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseHelper.messages({ (messages) in
            self.filterRead(messages: messages)
        })
    }
}

// MARK: - TableView Data source

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func filterRead(messages: [Message]) {
        var read = [Message]()
        
        for message in messages {
            if message.read {
                read.append(message)
            }
        }
        
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
            cell.actionLabel.text = messages[indexPath.row].action1
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
