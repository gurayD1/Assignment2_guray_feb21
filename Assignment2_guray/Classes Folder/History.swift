//
//  History.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-16.
//

import Foundation

class History{
    // properties
    var name : String?;
    var quantity : Int?;
    var totalPrice : Double?;
    var purchaseDate : String;
    // main constructor and assign value to the history class
    init (na: String, qu: Int, pr : Double){
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
       
        name = na;
        quantity = qu
        totalPrice = pr
        purchaseDate = formatter.string(from: today)
    }
}
