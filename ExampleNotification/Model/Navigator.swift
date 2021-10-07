//
//  Navigator.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import Foundation

struct Navigator: Codable {
    var screenName = ""
    var type = ""
    
    init(jsonData: [String : String]) {
        self.screenName = jsonData["screenName"] ?? "nothing"
        self.type = jsonData["type"] ?? "nothing"
    }
}
