//
//  CellInfoTableViewCell.swift
//  Catarina
//
//  Created by akira tsukamoto on 21/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class CellInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LabelTest: UILabel!
    @IBOutlet weak var icon: UIImageView!
    var caminho: String = ""
    
    
    func construtor(nlabelTest:String,nCaminho:String) {
        self.LabelTest.text = nlabelTest
        self.icon.image = UIImage.init(named: nCaminho)
    }

    func construtorDicionario(deDicionario:NSDictionary){

        self.LabelTest.text = (deDicionario["labeltest"] as! String)
        self.caminho = (deDicionario["caminhoimagem"] as! String)
        self.icon.image = UIImage.init(named: self.caminho)
    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
