//
//  RestockViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // outlet for main table
    @IBOutlet weak var mainTable: UITableView!
    // object for product manager class
    var manager : ProductManager?
    // variable to hold selected row index
    var selectedIndex : Int = 0;
    // boolean variable to check validation
    var isValid = false;
    // check if any row selected
    var isRowSelected = false;
    
    // set the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.allProducts.count)!;
    }
    // insert the data to the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = manager?.allProducts[indexPath.row].name;
        
        cell.detailTextLabel?.text = String((manager?.allProducts[indexPath.row].quantity)!);

        return cell;
    }
    

    @IBOutlet weak var quantityInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // get the selected row index
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         
         selectedIndex = indexPath.row;
         isRowSelected = true;
        
    }
    // if restock button clicked
    @IBAction func restockButtonClicked(_ sender: Any) {
       // if row selected get the user input quantity
        if isRowSelected{
        if let m : Int = Int(quantityInput.text!){
            if m > 0 {
            manager?.allProducts[selectedIndex].quantity = m;
                isValid = true
                isRowSelected = false;
                
            }
            else {
                let alert = UIAlertController(title: "Error", message: "quantity cannot be smaller than 0", preferredStyle: .alert)
                let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
            }
        }
        }
        // display error message user has to select product at the table
        else{
            let alert = UIAlertController(title: "Error", message: "you have to select a product from the table", preferredStyle: .alert)
            let action = UIAlertAction(title: "okey", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        
       // manager?.allProducts[selectedIndex].quantity = newquantity;
        mainTable.reloadData()
        // if it is not valid, display error message
        if !isValid{
        
                let alert = UIAlertController(title: "Error", message: "you have to provide quantity", preferredStyle: .alert)
                let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            
        }
        isRowSelected = false;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
