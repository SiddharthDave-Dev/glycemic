//
//  TableViewCell.swift
//  glycemic
//
//  Created by EMP on 10/10/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var GlNumber: UILabel!
    
    @IBOutlet weak var ingredients: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
