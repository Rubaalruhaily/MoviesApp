//
//  TopCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ruba on 28/08/1444 AH.
//

import UIKit

class TopMoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var TopImg: UIImageView!
    @IBOutlet weak var MovieTname: UILabel!
    @IBOutlet weak var generaM: UILabel!
    @IBOutlet weak var Duration: UILabel!
    
    
    
    func setupCellTop(topphoto: UIImage , topname:String , topgener : String , topdureatio: String){
        TopImg.image = topphoto
        MovieTname.text = topname
        generaM.text = topgener
        Duration.text = topdureatio
        
    }
}

    

