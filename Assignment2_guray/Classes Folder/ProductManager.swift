//
//  ProductNamanger.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import Foundation
import Metal

class ProductManager {
    // variable to hold selected row at the table
    var indexArray = 0;
    // boolean variable if the product already exist in the purchase list
    var isExist : Bool = false;
    // array Product class type
    var allProducts : [Product] = [Product]();
    // main constructor and assign default Product to the list
    init (){
        var Pants : Product = Product(na: "Pants", qu: 20, pr: 50)
    
        var Hats : Product = Product(na: "Hats", qu: 10, pr: 20)

        var Shoes : Product = Product(na: "Shoes", qu: 50, pr: 90)

        var Tshirts : Product = Product(na: "Tshirts", qu: 10, pr: 25)
        
        var Dresses : Product = Product(na: "Dresses", qu: 24, pr: 85)
        
        var Socks : Product = Product(na: "Socks", qu: 50, pr: 15)

        allProducts.insert(Pants, at: 0);
        allProducts.insert(Hats, at: 1);
        allProducts.insert(Shoes, at: 2);
        allProducts.insert(Tshirts, at: 3);
        allProducts.insert(Dresses, at: 4);
        allProducts.insert(Socks, at: 5);
}
    // add new product to the list
    func addNewProduct(name: String, quantity: Int, price : Double){
        
        allProducts.append(Product(na:name, qu: quantity, pr: price))
        
    }
}
