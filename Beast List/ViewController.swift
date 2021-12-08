//
//  ViewController.swift
//  Beast List
//
//  Created by Mac on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var textFieldArray = [String]()

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func beastButton(_ sender: UIButton){
        
        if let task = taskTextField.text {
        textFieldArray.append(task)
        tableView.reloadData()
        taskTextField.text = ""
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    

    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return an integer that indicates how many rows (cells) to draw
        return textFieldArray.count
    }

    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
                // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = textFieldArray[indexPath.row]
                // return cell so that Table View knows what to render in each row
            return cell
    }

}




