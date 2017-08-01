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
    
    var city: City? {
        didSet {
            guard let city = city else { return }
            let name = city.name
            
            heroID = "\(name)"
            
            nameLabel.text = name
            imageView.image = city.image
            descriptionLabel.text = useShortDescription ? city.shortDescription : city.description
        }
    }

}
