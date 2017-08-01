//
//	VWHero.swift
//
//	Create by Hipolito Arias on 31/7/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation

struct VWHero{

	var superheroes : [VWSuperheroe]!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		superheroes = [VWSuperheroe]()
		if let superheroesArray = dictionary["superheroes"] as? [[String:Any]]{
			for dic in superheroesArray{
				let value = VWSuperheroe(fromDictionary: dic)
				superheroes.append(value)
			}
		}
	}

    
}
