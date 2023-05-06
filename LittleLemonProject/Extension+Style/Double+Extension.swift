//
//  Double+Extension.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import Foundation
extension Double{
    
    var currencyFormat: NumberFormatter{
        
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.maximumFractionDigits = 2
        formater.locale = .current
     
        return formater
    }
    
    var currencyAsString: String{
        let amount = String(format: "$%.2f", self)
        return amount
    }
}
