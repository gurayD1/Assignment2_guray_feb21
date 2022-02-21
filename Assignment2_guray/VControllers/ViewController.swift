//
//  ViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-12.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    // outlet created for type, total amount, quantity,
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    ///
    
    // main table outlet
    @IBOutlet weak var mainTable: UITableView!
    
    // variable to hold user quantity input
    var quantityUserInput : String = "";
    // selected product index variable
    var selectedProductIndex : Int = -1;
    // boolean variable to check any product selected on the table
    var isSelectProduct : Bool = false;
    
    // variable to hold total price
    var totalPrice : Double = 0;
    
    // manager and history manager object
    var manager : ProductManager?
    var historyManager : HistoryManager?
   
    // reload te table when page is appeared
    override func viewWillAppear(_ animated: Bool){
        mainTable.reloadData()
    }
    
    // set number of rows of table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.allProducts.count)!
    }
    // insert the name, quantity and the price of products to the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableCell
        
        cell.nameFT.text = manager?.allProducts[indexPath.row].name;
        
        cell.quantityFT.text = String((manager?.allProducts[indexPath.row].quantity)!);
        
        cell.priceFT.text = String(( manager?.allProducts[indexPath.row].price)!);
        
        return cell;
    }
    // get the number of selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // update the type label depend on the selected product
        typeLabel.text = manager?.allProducts[indexPath.row].name;
        selectedProductIndex = indexPath.row;
        isSelectProduct = true;
    }
    // any button clicked this acton func will be called
    @IBAction func digitButtonClicked(_ sender: Any) {
        // variable to hold button title name
        var buttonTitle : String = "";
        // get the button name and assign to the variable
        if let title = (sender as! UIButton).titleLabel?.text{
            buttonTitle = title
            
        }
        // switch case block to compute the quantity
        switch(buttonTitle){
        case "1","2","3","4","5","6","7","8","9","0" :
            quantityUserInput += buttonTitle;
            break;
        default:
            break;
            
        }
        // if user select product and provide quantity
        if isSelectProduct && !quantityUserInput.isEmpty {
            // update the quantity label assign the user input
        quantityLabel.text = quantityUserInput;
            // compute the total price
         totalPrice = Double(quantityUserInput)!*(manager?.allProducts[selectedProductIndex].price)!
        // update the total label assing the total amount
        totalLabel.text = String(totalPrice);
        }
        
        else{
            // update the quantity user input variable
            quantityUserInput = "";
            // display the error message
            let alert = UIAlertController(title: "Error", message: "you have to select a product from the table and provide quantity", preferredStyle: .alert)
            let action = UIAlertAction(title: "okey", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        // if user clicked on the buy button
        if buttonTitle == "BUY"{
            // if user select any product on the table and provide quantity
            if selectedProductIndex > -1 && !quantityUserInput.isEmpty && isSelectProduct{
                // get the quantity from product stock
                var quantityProduct : Int = (manager?.allProducts[selectedProductIndex].quantity)!
            
                // substrack the user quantity input from quantity of product stock
                quantityProduct -= Int(quantityUserInput)!;
                
                // if user wants to buy more than stock
                if quantityProduct < 0 {
                    // display error message
                    let alert = UIAlertController(title: "Error", message: "Quantity cannot be bigger than stock", preferredStyle: .alert)
                    let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    present(alert, animated: true, completion: nil)
                    
                    resetAll();
                    
                }
                else{
                    // get selected products name
                    let na = manager?.allProducts[selectedProductIndex].name
                    // get quantity user input
                    let qu = Int(quantityUserInput);
                    // create new history object with name, quantity and the total price
                    historyManager?.addProductPurchaseList(name: na!, quantity: qu!, price: totalPrice)
                    // update the product quantity
                    manager?.allProducts[selectedProductIndex].quantity = quantityProduct
                // clear all labels
                    resetAll();

                }
            }
        }
        
    }
    // segue to send the data to the other page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toManager" {
       
        var destination = segue.destination as! ManagerViewController
        
        destination.manager = manager;
        destination.historyManager = historyManager;
        }
        
    }
    
   // reset all labels
    func resetAll(){
        mainTable.reloadData();
        quantityLabel.text = "Quantity";
        totalLabel.text = "Total"
        typeLabel.text = "Type";
        quantityUserInput = "";
        isSelectProduct = false ;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get the class object from app delegate
        if let m = (UIApplication.shared.delegate as! AppDelegate).manager{
            
            manager = m;
        }
        
        if let m = (UIApplication.shared.delegate as! AppDelegate).historyManager{
            
            historyManager = m;
        }
        
      /* let backBarButtonItem = UIBarButtonItem(title: "Cash Regisger App", style: .plain, target: nil, action: nil)
               navigationItem.backBarButtonItem = backBarButtonItem
        */
        navigationItem.backButtonTitle = "Cash Regisger App"
        
        
    }


}

