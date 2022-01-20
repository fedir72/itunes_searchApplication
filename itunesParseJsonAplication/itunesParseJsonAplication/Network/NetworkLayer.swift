//
//  NetworkLayer.swift
//  itunesParseJsonAplication
//
//  Created by Fedii Ihor on 18.01.2022.
//

import Foundation

//https://itunes.apple.com/search?term=jack+johnson&limit=25

class NetworkLayer {
    
    func getTracks(by term: String,completion: @escaping ((Result<SearchResponce,Error>) -> Void) ) {
        
        let urlstr =  "https://itunes.apple.com/search?term=\(term)&limit=10"
        guard let url = URL(string: urlstr) else {return}
        URLSession.shared.dataTask(with: url) { data,responce,error in
            
            print("data",data)
            print("error",error)
            print("responce",responce)
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
                guard let d = data else {return}
                
                do {
                    let result = try JSONDecoder().decode(SearchResponce.self, from: d)
                    completion(.success(result))
                } catch let jsonErr {
                    completion(.failure(jsonErr))
                    print("failed to decode json")
                }
            }
           
        }.resume()
    }
}
