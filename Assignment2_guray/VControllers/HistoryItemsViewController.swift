//
//  HistoryItemsViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import UIKit

class HistoryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var manager : ProductManager?
    var historyManager : HistoryManager?
    var indexNumber : Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (historyManager?.purshaseList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
       
        
        cell.nameHistoryTable.text = historyManager?.purshaseList[indexPath.row].name;
        
        cell.quantityHistoryTable.text = String((historyManager?.purshaseList[indexPath.row].quantity)!);
        
        //cell.priceFT.text = String(( manager?.allProducts[indexPath.row].price)!);
        
        return cell;
    }
    

    @IBOutlet weak var HistoryTable: UITableView!
    
   // var manager : ProductManager?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      
        indexNumber = indexPath.row
      
       // let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        
      //  productName =  cell.nameHistoryTable.text!
        //print(productName)
        //productName = "deneme"
        
        
      //  let indexPath = tableView.indexPathForSelectedRow() //optional, to get from any UIButton for example

           // let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell

           // print(currentCell.textLabel!.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
       
        if segue.identifier == "historyDetail" {
       
        var destination = segue.destination as! HistoryDetailViewController
        
            
       // destination.manager = manager;
        destination.historyManager = historyManager;
            destination.indexNumber = indexNumber ;
            
        }
        
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
