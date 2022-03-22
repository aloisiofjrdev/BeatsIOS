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
    
    var foneSelecionado: FonesViewModel?
    
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
        
        nomeLabel.text = "Modelo"
        notaLabel.text = "Nota"
        avaliacaoLabel.text = "Avaliações"
        precoLabel.text = "Preço"
        
        if let detalhesBeats = foneSelecionado {
            self.modelBeatsLabel.text = detalhesBeats.beatsModel
            self.nomeBeatsLabel.text = detalhesBeats.beatsModel
            self.precoBeatsLabel.text = detalhesBeats.price
            self.avaliacaoBeatsLabel.text = detalhesBeats.reviews
            self.notaBeatsLabel.text = detalhesBeats.rate
        }
    }
}
