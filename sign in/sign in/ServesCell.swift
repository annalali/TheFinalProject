//
//  CollectionViewCell.swift
//  TapBar
//
//  Created by sarahAldosari on 19/02/1444 AH.
//

import UIKit

class ServesCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    func setupCell(photo : UIImage, Name : String){
        image.image = photo
        name.text = ""
        
    }
    
}
