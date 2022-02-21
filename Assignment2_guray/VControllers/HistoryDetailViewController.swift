//
//  HistoryDetailViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import UIKit

class HistoryDetailViewController: UIViewController {

   // outlet for product detail label
    @IBOutlet weak var productDetailLabel: UITextView!
    // object for history manager class
    var historyManager : HistoryManager?
    // variable for selected row
    var indexNumber : Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // display the details of the product
    override func viewWillAppear(_ animated: Bool){
        
        let name = historyManager!.purshaseList[indexNumber].name!
        let price = historyManager!.purshaseList[indexNumber].totalPrice!
        let quantity = historyManager!.purshaseList[indexNumber].quantity!
        let time = historyManager!.purshaseList[indexNumber].purchaseDate
        
        productDetailLabel.text = "\(name) \n\(quantity) \n\(time) \nTotal amount \(price) \n"
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
