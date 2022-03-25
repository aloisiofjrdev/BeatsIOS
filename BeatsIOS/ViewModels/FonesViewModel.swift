//
//  FonesViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation
import UIKit

protocol FonesViewModelDelegate: AnyObject {
    func onLoadFones()
    func onError(error: Error)
}

class FonesViewModel {
    
    private weak var delegate: FonesViewModelDelegate?
    private let service: WebServiceProtocol
    private(set) var fones = [FonesModel]()
    var fones2 = [FonesModel]()
    
    init(delegate: FonesViewModelDelegate, service: WebServiceProtocol = WebService()) {
        self.delegate = delegate
        self.service = service
    }
    
    var fone: FonesModel?
    
    func loadFones() {
        service.getFones { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.delegate?.onError(error: error)
            case .success(let fones):
                
                self.fones = fones
                self.delegate?.onLoadFones()
                
            }
        }
    }
}



// viewmodelAntiga

//struct FonesViewModel {
//
//    // MARK: - Properties
//
//    var fone: Beat
//
//    var beatsModel: String {
//        return self.fone.beatsModel
//    }
//
//    var rate: String {
//
//        let rateString = "⭐ \(fone.rate)"
//
//        return rateString
//    }
//
//    var reviews: String {
//        return self.fone.reviews
//    }
//
//    var image: String {
//        return self.fone.image
//    }
//
//    var price: String {
//        return self.fone.price
//    }
//
//}
//
//    // MARK: - FonesViewModeList for TableView functions
//
//struct FonesViewModelList {
//    let fones: [Beat]
//}
//
//extension FonesViewModelList {
//
//    var numberOfSections: Int {
//        return 1
//    }
//
//    func numberOfRowsInSection(_ section: Int) -> Int {
//        return self.fones.count
//    }
//
//    func foneAtIndex(_ index: Int) -> FonesViewModel {
//        let fone = self.fones[index]
//        return FonesViewModel(fone: fone)
//    }
//
//}
