//
//  RestockViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var manager : ProductManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.allProducts.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = manager?.allProducts[indexPath.row].name;
        
        cell.detailTextLabel?.text = String((manager?.allProducts[indexPath.row].quantity)!);
        
       
        
       // cell.nameHistoryTable.text = historyManager?.purshaseList[indexPath.row].name;
        
      //  cell.quantityHistoryTable.text = String((historyManager?.purshaseList[indexPath.row].quantity)!);
        
        //cell.priceFT.text = String(( manager?.allProducts[indexPath.row].price)!);
        
        return cell;
    }
    

    @IBOutlet weak var quantityInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
