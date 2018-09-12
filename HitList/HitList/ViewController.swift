//
//  ViewController.swift
//  HitList
//
//  Created by Deo Kalule on 9/12/18.
//  Copyright © 2018 Deo Kalule. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // Added tableView dataSource from storyboard
    @IBOutlet weak var tableView: UITableView!
    
    // The names in the array
    var names: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = [String]()
        
    }// End viewDidLoad() Method
    
    // Pops up an alert and allows the user to enter a name
    @IBAction func addName(_ button: UIBarButtonItem){
        
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            // Get the alert textField and set the nameToSave equal to what is in that textField
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                    
                return
            }
            
            //Save the name and reload the data
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        
        alert.addTextField()
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(saveAction)
        
        present(alert, animated: true)
        
    }// End addName(_:) Method
    
    
    // Returns 1 for the single section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }// End numberOfSections(in: ) Method
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a cell and add a name
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        cell.textLabel?.text = names[indexPath.row]
        return cell
        
        
    }// End tableView(_: cellForRowAt: ) Method
    
    
    // Returns the number of names as the row count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }// End tableView(_: numberOfRowsInSection:) Method

}// End ViewController class

