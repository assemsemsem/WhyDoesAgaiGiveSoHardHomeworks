//
//  Character.swift
//  TheBigBigProblem
//
//  Created by Assem on 4/12/20.
//  Copyright © 2020 Assem. All rights reserved.
//

import Foundation

class Character: Codable {
    var name: String
       var status: String
       var id: Int
       var picURL: String
       var gender: String
    var charUrl: String
       
       enum CodingKeys: String, CodingKey {
           case name = "name"
           case status = "status"
           case id = "id"
           case picURL = "image"
           case gender = "gender"
        case charUrl = "url"
       }
}
