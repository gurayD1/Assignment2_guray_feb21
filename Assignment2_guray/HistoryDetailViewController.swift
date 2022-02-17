//
//  HistoryDetailViewController.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import UIKit

class HistoryDetailViewController: UIViewController {

   
    @IBOutlet weak var productDetailLabel: UITextView!
    
    var historyManager : HistoryManager?
    var indexNumber : Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = historyManager!.purshaseList[indexNumber].name!
        let price = historyManager!.purshaseList[indexNumber].totalPrice!
        let quantity = historyManager!.purshaseList[indexNumber].quantity!
        let time = historyManager!.purshaseList[indexNumber].purchaseDate
        
       print( "\(name) \n \(price) \n\(quantity) \n\(time) \n")
        
       // historyDetailLabel.text =  "\(name) \n \(price) \n\(quantity) \n\(time) \n"
       // labelDetail.text = "hey there"
       // historyDetailLabel.text = output;
        //print(productName);
        print("here")
        productDetailLabel.text = "\(name) \n\(quantity) \n\(time) \n Total amount \(price) \n"
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
