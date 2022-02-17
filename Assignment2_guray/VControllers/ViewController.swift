//
//  ViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-12.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var mainTable: UITableView!
    
    var quantityUserInput : String = "";
    var selectedProductIndex : Int = -1;
    var isSelectProduct : Bool = false;
    
    var totalPrice : Double = 0;
    
    var manager : ProductManager?
    
    var historyManager : HistoryManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.allProducts.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableCell
        
        cell.nameFT.text = manager?.allProducts[indexPath.row].name;
        
        cell.quantityFT.text = String((manager?.allProducts[indexPath.row].quantity)!);
        
        cell.priceFT.text = String(( manager?.allProducts[indexPath.row].price)!);
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        typeLabel.text = manager?.allProducts[indexPath.row].name;
        
        selectedProductIndex = indexPath.row;
        
        isSelectProduct = true;
        
        
    }
    
 
    
    
    
    @IBAction func digitButtonClicked(_ sender: Any) {
        
        
        
        var buttonTitle : String = "";
        if let title = (sender as! UIButton).titleLabel?.text{
            buttonTitle = title
            
        }
        
        switch(buttonTitle){
            
        case "1","2","3","4","5","6","7","8","9","0" :
            
            quantityUserInput += buttonTitle;
            break;
       
        default:
            break;
            
        }
        
       
        
       //print(selectedProductIndex)
        
        if isSelectProduct && !quantityUserInput.isEmpty {
            
        quantityLabel.text = quantityUserInput;
         totalPrice = Double(quantityUserInput)!*(manager?.allProducts[selectedProductIndex].price)!
        
        totalLabel.text = String(totalPrice);
        }
        else{
            quantityUserInput = "";
            let alert = UIAlertController(title: "Error", message: "you have to select a product from the table and provide quantity", preferredStyle: .alert)
            let action = UIAlertAction(title: "okey", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        if buttonTitle == "BUY"{
            
            if selectedProductIndex > -1 && !quantityUserInput.isEmpty && isSelectProduct{
                var quantityProduct : Int = (manager?.allProducts[selectedProductIndex].quantity)!
            
                quantityProduct -= Int(quantityUserInput)!;
                
                if quantityProduct < 0 {
                    
                    //quantityUserInput = "";
                    //quantityLabel.text = ""
                    let alert = UIAlertController(title: "Error", message: "Quantity cannot be bigger than stock", preferredStyle: .alert)
                    let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    present(alert, animated: true, completion: nil)
                    
                    resetAll();
                    
                }
                else{
                    
                    
                   // var product : Product = (manager?.allProducts[selectedProductIndex])!;
                    
                   // product.quantity = Int(quantityUserInput);
                    
                    let na = manager?.allProducts[selectedProductIndex].name
                   // let qu = manager?.allProducts[selectedProductIndex].quantity
                   // let pr = manager?.allProducts[selectedProductIndex].price
                    let qu = Int(quantityUserInput);
                    
                    historyManager?.addProductPurchaseList(name: na!, quantity: qu!, price: totalPrice)
                                         
                   // manager?.addProductPurchaseList(name: na!, quantity: qu!, price : pr!);
                    
                    manager?.allProducts[selectedProductIndex].quantity = quantityProduct
                    
                    
                    //manager?.addProductPurchaseList(product : product);
                
                    resetAll();
           
                    
            //selectedProductIndex = -1
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toManager" {
       
        var destination = segue.destination as! ManagerViewController
        
        destination.manager = manager;
            destination.historyManager = historyManager;
        }
        
    }
    
   
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
        // Do any additional setup after loading the view.
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

