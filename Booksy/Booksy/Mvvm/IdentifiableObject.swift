//
//  IdentifiableObject.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 09/11/2020.
//

import UIKit

protocol IdentifiableObject {

    static var identifier: String { get }
}

extension IdentifiableObject {
    
    static var identifier: String {
        return "\(self)"
    }
}
