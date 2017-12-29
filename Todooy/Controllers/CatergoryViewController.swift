//
//  CatergoryViewController.swift
//  Todooy
//
//  Created by Lou Macleod on 29/12/2017.
//  Copyright © 2017 Lou Macleod. All rights reserved.
//

import UIKit
import CoreData

class CatergoryViewController: UITableViewController {
  
  var categories = [Category]()
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

      print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

      loadCategories()

    }
  
  //MARK: - TableView Datasource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
    
    cell.textLabel?.text = categories[indexPath.row].name
//    let category = categories[indexPath.row]
//
//    cell.textLabel?.text = category.name
    
    //Ternary operator
    
//    cell.accessoryType = category.done ? .checkmark : .none
    
    return cell
    
  }
  
  //MARK: - TableView Delegate Methods

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToItems", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destinationVC = segue.destination as! ToDoListViewController
    
    if let indexPath = tableView.indexPathForSelectedRow {
          destinationVC.selectedCategory = categories[indexPath.row]
    }
  }
  
  //MARK: - Data Manipulation Methods
    
    func saveCategories() {
      
      do {
        try context.save()
      } catch {
        print("Error saving category \(error)")
      }
      self.tableView.reloadData()
    }
  
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {

      do {
          categories = try context.fetch(request)
      } catch {
          print("Error loading categories \(error)")
      }

      tableView.reloadData()

    }

  //MARK: - Add new Categories

  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add new category", message:"", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add", style: .default) { (action) in
      //what will happen once the user clicks Add Item button on out UIAlert
      
//      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      
      let newCategory = Category(context: self.context)
      newCategory.name = textField.text!
//      newCategory.done = false
      self.categories.append(newCategory)

      self.saveCategories()
    }
    
    alert.addAction(action)
    
    alert.addTextField { (field) in
      textField = field
      textField.placeholder = "Add a new category"
    }
    
    
    present(alert, animated: true, completion: nil)

  }
}





