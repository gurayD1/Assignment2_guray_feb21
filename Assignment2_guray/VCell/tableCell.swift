//
//  tableCell.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import UIKit

class tableCell: UITableViewCell {

    // outlet for label of tabla
    @IBOutlet weak var quantityFT: UILabel!
    @IBOutlet weak var priceFT: UILabel!
    @IBOutlet weak var nameFT: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
