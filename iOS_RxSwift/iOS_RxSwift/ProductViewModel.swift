//
//  ProductViewModel.swift
//  iOS_RxSwift
//
//  Created by Eslam Ali  on 20/03/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct productViewModel {
    var items = PublishSubject <[Product]>()
   
    
    // you can fetch items from core data or API but it's a simple Example
    // we just put the data manually
    func fetchItems()  {
         let product = [
         Product(productName: "Home", productImage: "house"),
            Product(productName: "Settings", productImage: "gear"),
            Product(productName: "profile", productImage: "person"),
            Product(productName: "Filght", productImage: "airplane"),
            Product(productName: "Activity", productImage: "bell"),
 
         ]
        items.onNext(product)
        items.onCompleted()
    }
    
}
