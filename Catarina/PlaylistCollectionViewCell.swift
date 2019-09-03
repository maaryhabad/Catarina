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
