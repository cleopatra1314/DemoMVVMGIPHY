//
//  GIPViewModel.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation

protocol GipViewModelDelegate: AnyObject {
    func didFinish()
    func didFailure()
}

class GipViewModel {
    
    weak var delegate: GipViewModelDelegate?
    
    private(set) var gipData = [GIPItem]()
    
//    @MainActor
    func getGip() {
        
        GipClient.shared.getGIPData { result in
            self.gipData = result
            self.delegate?.didFinish()
            
        } failure: { error in
            print(error)
            self.delegate?.didFailure()
        }
        
    }
    
}
