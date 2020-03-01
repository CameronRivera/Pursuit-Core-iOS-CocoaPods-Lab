//
//  RandomUsersAPI.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation
import Alamofire

struct RandomUsersAPI {
    static func retrieveRandomUsers(completion: @escaping (AFResult<[User]>) -> ()){
        let endpointURL = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpointURL) else {
            return
        }
        
        AF.request(url).response { response in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results.results))
                } catch {
                    print("Decoding Error: \(error)")
                }
            }
        }
    }
    
    static func retrieveRandomUserPicture(_ imageUrl: String ,completion: @escaping (AFResult<UIImage>) -> ()) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        AF.request(url).response { response in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data{
                if let image = UIImage(data: data){
                    completion(.success(image))
                }
            }
        }
    }
}
