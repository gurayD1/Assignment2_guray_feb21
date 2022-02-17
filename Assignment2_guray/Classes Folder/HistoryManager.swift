//
//  HistoryManager.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import Foundation

class HistoryManager {
    
    var isExist : Bool = false;

    var purshaseList : [History] = [History]();

    func addProductPurchaseList( name: String, quantity: Int, price : Double){
        var history : History = History(na: name, qu: quantity, pr : price);
        history = productExist(product: history);
        purshaseList.append(history);
        
    }
    
    func productExist (product : History) -> History{
        var indexArray = 0;
        for historyElement in purshaseList{
            if historyElement.name == product.name {
                isExist = true;
                let quantity : Int = historyElement.quantity!
                purshaseList.remove(at: indexArray)
                product.quantity = product.quantity! + quantity;
                return product
            }
            indexArray += 1
        }
        return product
    }
}
