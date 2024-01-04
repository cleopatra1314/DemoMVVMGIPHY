//
//  GIPViewModel.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation

class GIPViewModel {
    
    private(set) var gipData = [GIPItem]()
    
    func getGip() {
        
        GipClient.shared.getGIPData { result in
            self.gipData = result
            
        } failure: { error in
            print(error)
        }
        
    }
    
}
