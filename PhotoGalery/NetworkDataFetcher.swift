//
//  NetworkDataFercher.swift
//  PhotoGalery
//
//  Created by Olzhas Zhakan on 03.09.2023.
//

import Foundation

class NetworkDataFetcher {
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.request(seatchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Eror received requesting data : \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil}
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
}
