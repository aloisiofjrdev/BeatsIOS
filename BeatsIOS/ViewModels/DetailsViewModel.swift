//
//  DetailsViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation

struct DetailsViewModel {
    
    var details: DetailsModel
    
    init(details: DetailsModel) {
        self.details = details
    }
    
    var nomeText: String {
        return self.details.nomeText
    }
    
    var notaText: String {
        return self.details.notaText
    }
    
    var avaliacaoText: String {
        return self.details.avaliacaoText
    }
    
    var precoText: String {
        return self.details.precoText
    }
}
