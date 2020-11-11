//
//  BindableViewController.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 09/11/2020.
//

import UIKit

class BindableView<T: BaseViewModel>: UIView, GenericBindable, BindingTarget {
    
    weak var viewModel: T?
        
    func bind(source: T) {
        source.bindingTarget = self
        
        self.viewModel = source
    }
        
    func viewModelDidUpdate(_ updatedProperty: AnyKeyPath?) { }
    
    func invokeEvent(_ event: MyEvent) {
        viewModel?.handleEvent(event)
    }
}


class BindableViewController<ViewModel: RootViewModel>: UIViewController, BindingTarget {
    
    let viewModel: ViewModel = ViewModel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.bindingTarget = self

        viewModel.bindingDidComplete()
    }
    
    func viewModelDidUpdate(_ updatedProperty: AnyKeyPath?) { }
    
    func invokeEvent(_ event: MyEvent) {
        viewModel.handleEvent(event)
    }
}
