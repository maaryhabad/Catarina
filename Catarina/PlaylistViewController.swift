//
//  PlaylistViewController.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource {

    
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlaylistModel.instance.playlists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celula", for: indexPath) as! PlaylistCollectionViewCell
        cell.displayPlaylist(playlist: PlaylistModel.instance.playlists[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = URL(string: PlaylistModel.instance.playlists[indexPath.row].urlDaPlaylist) else { return }
        UIApplication.shared.open(url)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
