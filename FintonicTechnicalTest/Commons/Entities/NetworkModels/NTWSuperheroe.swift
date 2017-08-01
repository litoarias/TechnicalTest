//
//	NTWSuperheroe.swift
//
//	Create by Hipolito Arias on 31/7/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation 
import ObjectMapper


class NTWSuperheroe : NSObject, NSCoding, Mappable{

	var abilities : String?
	var groups : String?
	var height : String?
	var name : String?
	var photo : String?
	var power : String?
	var realName : String?


	class func newInstance(map: Map) -> Mappable?{
		return NTWSuperheroe()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		abilities <- map["abilities"]
		groups <- map["groups"]
		height <- map["height"]
		name <- map["name"]
		photo <- map["photo"]
		power <- map["power"]
		realName <- map["realName"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         abilities = aDecoder.decodeObject(forKey: "abilities") as? String
         groups = aDecoder.decodeObject(forKey: "groups") as? String
         height = aDecoder.decodeObject(forKey: "height") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         power = aDecoder.decodeObject(forKey: "power") as? String
         realName = aDecoder.decodeObject(forKey: "realName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if abilities != nil{
			aCoder.encode(abilities, forKey: "abilities")
		}
		if groups != nil{
			aCoder.encode(groups, forKey: "groups")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if power != nil{
			aCoder.encode(power, forKey: "power")
		}
		if realName != nil{
			aCoder.encode(realName, forKey: "realName")
		}

	}

}
