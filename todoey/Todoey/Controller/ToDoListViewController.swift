//
// ToDoListViewController
//  Todoey
//
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        print(dataFilePath)
        
        
//        let newItem = Item()
//        newItem.title = "Find Alex"
//        itemArray.append(newItem)
//
//        let newItem1 = Item()
//        newItem1.title = "Find Peter"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.title = "Find Nancy"
//        itemArray.append(newItem2)
        loadItem()

//        if let array = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = array
//        }
      
    }

    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath )
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        self.saveItem()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items
   
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what sill happen once the user clicks the Add Item button on our UIAlert
            
//            print(textField.text ?? "n/a")
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveItem()
            
            
            
           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
    }
    
    func saveItem() {
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(itemArray)
            
            try data.write(to: self.dataFilePath!)

        } catch{
            print("error encoding item array, \(error)")
            
        }
        self.tableView.reloadData()
    }
    
    func loadItem() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                 itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("error decoding item \(error)")
            }
        }
    }
    
    
}





