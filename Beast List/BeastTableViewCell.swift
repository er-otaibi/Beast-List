//
//  BeastTableViewCell.swift
//  Beast List
//
//  Created by Mac on 04/05/1443 AH.
//

import UIKit

class BeastTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    var delegate: BeastCellDelegate?
    
    @IBAction func showButton(_ sender: UIButton) {
        
        delegate?.showTaskDescription(description: (self.taskLabel?.text)!)
    }
}
