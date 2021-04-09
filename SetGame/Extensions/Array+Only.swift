//
//  Array+Only.swift
//  Memorize
//
//  Created by Ken Goettler on 4/5/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
