//
//  UIImageView.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 01/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    public func loadImage(url: String) {
        Alamofire.request(url, method: .get).responseImage { response in
            guard let respImage = response.result.value else {
                // Handle error
                return
            }
            DispatchQueue.main.async {
                self.image = respImage
            }
        }

    }
    
}
