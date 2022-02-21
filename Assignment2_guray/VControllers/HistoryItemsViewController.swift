//
//  HistoryItemsViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import UIKit

class HistoryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // objects for classses
    var manager : ProductManager?
    var historyManager : HistoryManager?
    // variable for selected product index number
    var indexNumber : Int = 0
    
    @IBOutlet weak var HistoryTable: UITableView!
    
    // set the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (historyManager?.purshaseList.count)!
    }
    // insert the data to the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        cell.nameHistoryTable.text = historyManager?.purshaseList[indexPath.row].name;
        
        cell.quantityHistoryTable.text = String((historyManager?.purshaseList[indexPath.row].quantity)!);
        
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.backButtonTitle = "History Items"
        
    }
    // send the selected row at the table
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
         indexNumber = indexPath.row
         return indexPath;
    }
    // reload the data at the table when page appear
    override func viewWillAppear(_ animated: Bool){
        HistoryTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // send the data to the othe rpage
        if segue.identifier == "historyDetail" {
       
        var destination = segue.destination as! HistoryDetailViewController

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
