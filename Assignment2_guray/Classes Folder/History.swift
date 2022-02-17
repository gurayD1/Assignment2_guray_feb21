//
//  History.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import Foundation

class History{
    
    var name : String?;
    var quantity : Int?;
    var totalPrice : Double?;
    var purchaseDate : String;
    
    init (na: String, qu: Int, pr : Double){
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        print(formatter.string(from: today))
        
        //let date = Date(timeIntervalSinceReferenceDate: 118800)
      //  let formatter = DateFormatter()
       // formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
      //  purchaseDate = formatter.string(from: date)
       
        name = na;
        quantity = qu
        totalPrice = pr
        //purchaseDate = Date()
        
        purchaseDate = formatter.string(from: today)
    }
}
