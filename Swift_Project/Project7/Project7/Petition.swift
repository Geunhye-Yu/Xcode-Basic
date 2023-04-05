//
//  Petition.swift
//  Project7
//
//  Created by Geunhye Yu on 2023/03/28.
//

import Foundation

//Swift's protocol that supports to work with JSON" Codable
//"Codable"can convert freely between data and JSON 
struct Petition: Codable{
    var title: String
    var body: String
    var signatureCount: Int
}
