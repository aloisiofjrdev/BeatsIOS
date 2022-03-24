//
//  DetailsBeatsViewController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 21/03/22.
//

import Foundation
import UIKit

class DetailsBeatsViewController: UIViewController {
    
    
    //MARK: - Properties
    @IBOutlet weak var modelBeatsLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nomeBeatsLabel: UILabel!
    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var notaBeatsLabel: UILabel!
    @IBOutlet weak var avaliacaoLabel: UILabel!
    @IBOutlet weak var avaliacaoBeatsLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var precoBeatsLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var foneVM: FonesViewModel?
    var detailsVM: DetailsViewModel = DetailsViewModel()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureNavigation()
    }
    
    
    //MARK: - Helpers
    
    func configureNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
    func setup() {
        
        
        buyButton.layer.cornerRadius = 20
        buyButton.tintColor = .white
        buyButton.setTitle(detailsVM.buyButtonText, for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buyButton.setTitleColor(.white, for: .normal)
        
        nomeLabel.text = detailsVM.nomeText
        notaLabel.text = detailsVM.notaText
        avaliacaoLabel.text = detailsVM.avaliacaoText
        precoLabel.text = detailsVM.precoText
        
        if let foneVM = foneVM {
            self.modelBeatsLabel.text = foneVM.beatsModel
            self.nomeBeatsLabel.text = foneVM.beatsModel
            self.precoBeatsLabel.text = foneVM.price
            self.avaliacaoBeatsLabel.text = foneVM.reviews
            self.notaBeatsLabel.text = foneVM.rate
        }
    }
}
