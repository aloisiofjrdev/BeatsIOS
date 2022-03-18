//
//  FonesViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 18/03/22.
//

import Foundation

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
        return FonesViewModel(fone)
    }
    
}

struct FonesViewModel {
    private let fone: Beat
}

extension FonesViewModel {
    init(_ fone: Beat) {
        self.fone = fone
    }
}

extension FonesViewModel {
    
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
