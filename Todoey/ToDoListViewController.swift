//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by Corey Tucker on 9/23/18.
//  Copyright © 2018 Corey Tucker. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Do Homework", "Study For Exam", "Program", "Read", "Exercise", "Make Dinner"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items =  defaults.array(forKey: "ToDoListArray") as? [String] {
             itemArray = items
        }
      
    }
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemArray.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType =  .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType =  .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item To List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:  "Add Item", style: .default) { (action) in
            // What Will Happen When Add Item Is Pressed
        
        self.itemArray.append(textField.text!)
            
        self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
        self.tableView.reloadData() 
            
        }
        
        alert.addTextField { (alertTextField ) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        
        }
        
        // Pop Up Notifitcation
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
}

 
