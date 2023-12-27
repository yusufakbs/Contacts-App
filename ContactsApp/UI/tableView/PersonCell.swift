//
//  PersonCell.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 28.12.2023.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var labelPersonName: UILabel!
    @IBOutlet weak var labelPersonNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
