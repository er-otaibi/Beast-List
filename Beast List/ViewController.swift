//
//  ViewController.swift
//  Beast List
//
//  Created by Mac on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController , BeastCellDelegate {
    
    var textFieldArray = [String]()

    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func beastButton(_ sender: UIButton){
        
        if let task = taskTextField.text {
        textFieldArray.append(task)
        tableView.reloadData()
        taskTextField.text = ""
            
        }
    }
    
    func showTaskDescription(description: String) {
            descriptionLabel.text = description
        }
    
}

extension ViewController: UITableViewDataSource , UITableViewDelegate {
    

    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return an integer that indicates how many rows (cells) to draw
        return textFieldArray.count
    }

    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! BeastTableViewCell
                // set text label to the model that is corresponding to the row in array
        cell.taskLabel.text = textFieldArray[indexPath.row]
        
        // This line is very important! Now the cell has a reference to the view controller itself.
        cell.delegate = self
        
                // return cell so that Table View knows what to render in each row
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        textFieldArray.remove(at: indexPath.row)
        tableView.reloadData()
    }


}







