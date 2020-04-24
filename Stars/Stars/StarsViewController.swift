//
//  ViewController.swift
//  Stars
//
//  Created by Ian French on 4/23/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    let starController = StarController()

    @IBAction func printButtonTapped(_ sender: Any) {}
   
    @IBAction func createButtonTapped(_ sender: Any) {
        
        guard let starName = nameTextField.text,
            let distanceInLightYears = distanceTextField.text,
         let distance = Double(distanceInLightYears),
        !starName.isEmpty else {return}
        
        starController.createStar(name: starName, distance: distance)
        self.tableView.reloadData()
    
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StarCell") as? StarTableViewCell else { return UITableViewCell() }
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
    
}
    







class StarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet {
            self.updateViews()
            
        }
    }
    
    func updateViews() {
        guard let star = star else { return }
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) light years away"
    
        }
    
    }


