//
//  NetworkService.swift
//  PhotoGalery
//
//  Created by Olzhas Zhakan on 02.09.2023.
//

import Foundation

class NetworkService {
    
    func request(seatchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareParaments(seatchTerm: seatchTerm)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepateHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    private func prepateHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID UfQSd29o3bFUxbK_RqnMuEtSDTveUPCiQMn1UQGI0Jw"
        return headers
    }
    private func prepareParaments(seatchTerm: String?) -> [String:String] {
        var parameters = [String: String]()
        parameters["query"] = seatchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
