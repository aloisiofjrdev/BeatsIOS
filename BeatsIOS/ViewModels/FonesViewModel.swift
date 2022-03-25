//
//  FonesViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation

struct FonesViewModel {
    
    // MARK: - Properties
    
    var fone: Beat
    
    var beatsModel: String {
        return self.fone.beatsModel
    }
    
    var rate: String {
        
        let rateString = "⭐ \(fone.rate)"
        
        return rateString
    }
    
    var reviews: String {
        return self.fone.reviews
    }
    
    var image: String {
        return self.fone.image
    }
    
    var price: String {
        return self.fone.price
    }
    
}

    // MARK: - FonesViewModeList for TableView functions

struct FonesViewModelList {
    let fones: [Beat]
}

extension FonesViewModelList {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.fones.count
    }
    
    func foneAtIndex(_ index: Int) -> FonesViewModel {
        let fone = self.fones[index]
        return FonesViewModel(fone: fone)
    }
    
}
