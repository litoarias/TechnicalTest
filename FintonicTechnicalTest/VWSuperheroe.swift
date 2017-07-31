//
//	VWSuperheroe.swift
//
//	Create by Hipolito Arias on 31/7/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation

struct VWSuperheroe{

	var abilities : String!
	var groups : String!
	var height : String!
	var name : String!
	var photo : String!
	var power : String!
	var realName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		abilities = dictionary["abilities"] as? String
		groups = dictionary["groups"] as? String
		height = dictionary["height"] as? String
		name = dictionary["name"] as? String
		photo = dictionary["photo"] as? String
		power = dictionary["power"] as? String
		realName = dictionary["realName"] as? String
	}

}
