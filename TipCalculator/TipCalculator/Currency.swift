//
//  Currency.swift
//  TipCalculator
//
//  Created by Tam Nguyen on 2/11/17.
//
//

import Foundation

extension Double{
    var asLocaleCurrency : String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency;
        formatter.locale = Locale.current;
        formatter.minimumFractionDigits = 2;
        return formatter.string(from: NSNumber(value : self))!;
    }
}
