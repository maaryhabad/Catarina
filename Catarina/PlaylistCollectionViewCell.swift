//
//  PlaylistCollectionViewCell.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class PlaylistCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayPlaylist(playlist: Playlist) {
        
        let capa = playlist.capaDaPlaylist
        let titulo = playlist.tituloDaPlaylist
        
        label.text = titulo
        imageView.image = UIImage(named: capa)
    }
    
}
