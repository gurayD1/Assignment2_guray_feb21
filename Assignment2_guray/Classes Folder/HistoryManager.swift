//
//  HistoryManager.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import Foundation

class HistoryManager {
    // variable to hold index number of selected row
    var indexArray = 0;
    // boolean variable if the product already exist on the purchase list
    var isExist : Bool = false;
    // array to collect purchase product
    var purshaseList : [History] = [History]();
    // add product to the purchase list
    func addProductPurchaseList( name: String, quantity: Int, price : Double){
        // create new history for product
        var history : History = History(na: name, qu: quantity, pr : price);
        // check if already exist
        history = productExist(product: history);
        // add to the list
        purshaseList.insert(history, at: indexArray)
        
    }
    // check if procut exist in the purchase list
    func productExist (product : History) -> History{
         indexArray = 0;
        // for loop for each element of purchase list
        for historyElement in purshaseList{
            // if name is equal
            if historyElement.name == product.name {
                // set exist true
                isExist = true;
                // get the quantity from product
                let quantity : Int = historyElement.quantity!
                // remove this product from the list
                purshaseList.remove(at: indexArray)
                // update the quantity of product
                product.quantity = product.quantity! + quantity;
                //return the product
                return product
            }
            indexArray += 1
        }
        return product
    }
}
