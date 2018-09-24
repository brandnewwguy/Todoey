//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by Corey Tucker on 9/23/18.
//  Copyright © 2018 Corey Tucker. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Do Homework"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Study"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Excercise"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Read"
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "Grocery Shopping" 
        itemArray.append(newItem5)
        
        if let items =  defaults.array(forKey: "ToDoListArray") as? [Item] {
             itemArray = items
        }
      
    }
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemArray.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done  ? .checkmark : .none
        
        return cell
    }
    
    // MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item To List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:  "Add Item", style: .default) { (action) in
            // What Will Happen When Add Item Is Pressed
            
        let newItem = Item()
        newItem.title = textField.text!
        
        self.itemArray.append(newItem)
            
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

 
