//
//  APIHandler.swift
//  MVCAPICalling
//
//  Created by Arpit iOS Dev. on 13/06/24.
//

import Foundation
import UIKit
import Alamofire

class APIHandler {
    static let shared = APIHandler()
    
    func fetchUserData(completion: @escaping (Result<[UserData], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        
        AF.request(urlString).responseDecodable(of: [UserData].self) { response in
            switch response.result {
            case .success(let comments):
                completion(.success(comments))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
