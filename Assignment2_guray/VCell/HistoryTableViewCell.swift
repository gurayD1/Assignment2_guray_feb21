//
//  HistoryTableViewCell.swift
//  Assignment2_guray
//
//  Created by Guray Demirezen on 2022-02-14.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    // outlet for label of the table
    @IBOutlet weak var nameHistoryTable: UILabel!
    @IBOutlet weak var quantityHistoryTable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
