//
//  BeatsCellTableViewCell.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit

class BeatsCellTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var viewTableCell: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var beatImage: UIImageView!
    @IBOutlet weak var nameFoneLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    //MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI() {
        beatImage.layer.cornerRadius = 10
    }

}
