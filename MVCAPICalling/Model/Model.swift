//
//  Model.swift
//  MVCAPICalling
//
//  Created by Arpit iOS Dev. on 13/06/24.
//

import Foundation
import UIKit

struct UserData: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
