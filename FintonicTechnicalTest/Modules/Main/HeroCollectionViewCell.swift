//
//  HeroCollectionViewCell.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 01/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var useShortDescription: Bool = true
    
    var hero: VWSuperheroe? {
        didSet {
            guard let hero = hero else { return }
            
            if let name = hero.name, let realName = hero.realName {
                heroID = "\(name)"
                nameLabel.text = name
                descriptionLabel.text = realName
            }
            
            if let urlImg = hero.photo {
                imageView.loadImage(url: urlImg)
            }
            
        }
    }

}
