//
//  ViewController.swift
//  Stars
//
//  Created by Ian French on 4/23/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
    
    
  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var distanceTextField: UITextField!
    

    @IBAction func printButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func createButtonTapped(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

    
    

}




class StarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
}

