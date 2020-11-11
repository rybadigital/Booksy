//
//  BindableCollectionViewCell.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 10/11/2020.
//

import UIKit

class BindableCollectionViewCell<T: BaseViewModel & IdentifiableObject>: UICollectionViewCell, GenericBindable, BindingTarget, IdentifiableObject {
    
    static var identifier: String {
        return T.identifier
    }
    
    weak var viewModel: T?
        
    func bind(source: T) {
        source.bindingTarget = self
        
        self.viewModel = source
    }
        
    func viewModelDidUpdate(_ updatedProperty: AnyKeyPath?) { }
}
