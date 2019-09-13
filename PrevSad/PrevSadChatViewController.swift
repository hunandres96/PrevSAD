//
//  PrevSadChatViewController.swift
//  PrevSad
//
//  Created by Andres Hun on 2/17/19.
//  Copyright © 2019 Andres Hun. All rights reserved.
//

import UIKit
import Foundation
import CoreML
import NaturalLanguage

class PrevSadChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sadClassifier = sadPhrasesClassifier()
    
    var messagesArray = [String]()
    
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var tableMessages: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableMessages.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableMessages.delegate = self
        tableMessages.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) //as! messageTableViewCell
        
        cell.textLabel?.text = self.messagesArray[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
//        var messages = [sadPhrasesClassifierInput]()
//        let messagesForClassification = sadPhrasesClassifierInput(text: messageField.text!)
//        messages.append(messagesForClassification)
        
        messagesArray.append(messageField.text!)
        messageField.text?.removeAll()
        tableView.reloadData()
        
//        let prediction = try! sadClassifier.prediction(text: "today was an excellent day")
//        print(prediction.label)
        
        let predictions = try! sadClassifier.prediction(text: "\(messagesArray.last)")
        print(predictions.label)
        print(messagesArray.last)
        
        if predictions.label == "suicide" {
            let alert = UIAlertController(title: "Suicide", message: "Do you need me to do something?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if predictions.label == "anxiety" {
            let alert = UIAlertController(title: "Anxiety", message: "Is there something I could do?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if predictions.label == "depression" {
            let alert = UIAlertController(title: "Depression", message: "All of what you are going through would end, you do know that right?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if predictions.label == "positive" {
            let alert = UIAlertController(title: "Positive", message: "I am so happy for you!!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Keep it going!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            return
        }
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
    }
    
    
}
