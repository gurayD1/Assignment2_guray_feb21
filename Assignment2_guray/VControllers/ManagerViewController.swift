//
//  ManagerViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import UIKit

class ManagerViewController: UIViewController {

    // class object for classes
    var manager : ProductManager?
    var historyManager : HistoryManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "Manager Page"
    }
    
    // seque to send the data to another page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "HistoryItems" {
       
        var destination = segue.destination as! HistoryItemsViewController
        
        destination.manager = manager;
        destination.historyManager = historyManager;
        }
        else if segue.identifier == "restock" {
            
            var destination = segue.destination as! RestockViewController
            destination.manager = manager;
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
