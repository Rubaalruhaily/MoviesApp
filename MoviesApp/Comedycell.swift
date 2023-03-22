//
//  ComedyCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ruba on 23/08/1444 AH.
//

import UIKit

class Comedycell: UICollectionViewCell {
    
    @IBOutlet weak var Comedyimg: UIImageView!
    
    func steupCell2 (comedymovies: UIImage){
        Comedyimg.image = comedymovies
    }
    
}
