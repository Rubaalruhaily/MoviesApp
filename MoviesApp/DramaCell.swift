//
//  DramaCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ruba on 23/08/1444 AH.
//

import UIKit

class DramaCell: UICollectionViewCell {

    @IBOutlet weak var Dramaimg: UIImageView!
    
    func steupCell1 (dramaphoto: UIImage){
        Dramaimg.image = dramaphoto
    }
    
}
