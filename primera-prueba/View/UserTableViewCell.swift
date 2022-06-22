//
//  UserTableViewCell.swift
//  primera-prueba
//
//  Created by Brayam Mora on 13/06/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }
    
    func configure(_ name: String, _ phone: String, _ email: String) {
        usernameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = email
    }
}
