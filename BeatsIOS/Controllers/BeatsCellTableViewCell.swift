//
//  BeatsCellTableViewCell.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit

class BeatsCellTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var labelTest: UILabel!
    
    
    //MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
