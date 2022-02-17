//
//  ProductNamanger.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import Foundation
import Metal

class ProductManager {
    
    var isExist : Bool = false;
    var allProducts : [Product] = [Product]();
    
    var purshaseList : [Product] = [Product]();
    init (){
        var Pants : Product = Product(na: "Pants", qu: 20, pr: 50)
    
    
    var Hats : Product = Product(na: "Hats", qu: 10, pr: 20)

var Shoes : Product = Product(na: "Shoes", qu: 50, pr: 90)

        allProducts.insert(Pants, at: 0);
        allProducts.insert(Hats, at: 1);
        allProducts.insert(Shoes, at: 2);
}
    
    func addNewProduct(name: String, quantity: Int, price : Double){
        
        allProducts.append(Product(na:name, qu: quantity, pr: price))
        
    }
    /*
    func addProductPurchaseList( product : Product){
        let product1 : Product = productExist(product: product);
        purshaseList.append(product1)
        
    }
     */
    
    func addProductPurchaseList( name: String, quantity: Int, price : Double){
        var product : Product = Product(na: name, qu: quantity, pr: price);
        product = productExist(product: product);
        
        purshaseList.append(product);
        
    }
    
    func productExist (product : Product) -> Product{
        var indexArray = 0;
        for productElement in purshaseList{
            
            if productElement.name == product.name {
                
                isExist = true;
                let quantity : Int = productElement.quantity!
                purshaseList.remove(at: indexArray)
                product.quantity = product.quantity! + quantity;
                return product
                
                
            }
            
            indexArray += 1
           
            
        }
        return product
    }
}
