//
//  CellPrincipalViewTableViewCell.swift
//  Catarina
//
//  Created by Mateus Nunes on 22/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class CellPrincipalViewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblConcluido: UILabel!
    @IBOutlet weak var imgPeriodo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
