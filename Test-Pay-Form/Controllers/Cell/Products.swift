//
//  Products.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/2/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class Products: UICollectionViewCell {

    @IBOutlet weak var Image1:UIImageView!
    @IBOutlet weak var NameLabel:UILabel!
    @IBOutlet weak var typeAddressLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        Image1.layer.cornerRadius = 20.0
    }

}
