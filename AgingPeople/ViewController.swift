//
//  ViewController.swift
//  BeastList
//
//  Created by Lisa Ryland on 1/12/18.
//  Copyright © 2018 Lisa Ryland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Create this array at the top of your class as a property
    var peopleArr = ["George", "Betty", "Fran", "Joe", "Helda", "Winifred", "Zed", "Sara", "Jeffy", "Abraham", "Anna", "Melinda"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        peopleArr.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    // how many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArr.count
    }
    
    // how should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = peopleArr[indexPath.row]
        cell.detailTextLabel?.text = "\(arc4random_uniform(91) + 5) years old"
        
        // return cell so that Table View knows what to render in each row
        return cell
    }
    
}


