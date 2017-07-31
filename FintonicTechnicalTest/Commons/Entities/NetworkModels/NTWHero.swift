//
//	NTWHero.swift
//
//	Create by Hipolito Arias on 31/7/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation 
import ObjectMapper


class NTWHero : NSObject, NSCoding, Mappable{

	var superheroes : [NTWSuperheroe]?


	class func newInstance(map: Map) -> Mappable?{
		return NTWHero()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		superheroes <- map["superheroes"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         superheroes = aDecoder.decodeObject(forKey: "superheroes") as? [NTWSuperheroe]
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if superheroes != nil{
			aCoder.encode(superheroes, forKey: "superheroes")
		}

	}

}
