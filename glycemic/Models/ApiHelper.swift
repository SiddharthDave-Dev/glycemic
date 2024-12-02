//
//  ApiHelper.swift
//  glycemic
//
//  Created by EMP on 10/10/2023.
//

import Foundation

class ApiHelper {
    
    static let sharedInstance = ApiHelper()
    
    func foodInfo(completion : @escaping (ApiModel) -> Void) {
        	
        guard let url = ApiUrl.shared.baseUrl else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error is \(error)")
            }
            
            guard let data = data else { return
                print(data ?? "")
            }
            
            if response != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let resData = try decoder.decode(ApiModel.self, from: data )
                    completion(resData)
                    print(resData)
                } catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
