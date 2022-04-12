//
//  NetworkManager.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

enum RequestType {
    case peopleList
    case roomList
    case invalidRequest // Testing Purpose
    
    var path: String {
        switch self {
            case .peopleList: return "v1/people"
            case .roomList: return "v1/rooms"
            case .invalidRequest: return "/invalid"
        }
    }
}

struct NetworkManager {

    func fetch<T: Codable>(requestType: RequestType, responseType: T.Type, handler: @escaping (Result<T, Error>) -> Void)  {
        
        guard let baseURLPath = Bundle.main.baseURL, let baseURL = URL(string: baseURLPath) else {
            handler(.failure(SquadError(description: "error.network.baseurl.notfound".localized)))
            return
        }
        
        let requestURL = baseURL.appendingPathComponent(requestType.path)
    
        let dataTasks = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            guard let responseData = data else {
                handler(.failure(error ?? SquadError(description: "error.network.noresponse".localized)))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.responseDateFormate)
                let response = try JSONDecoder().decode(T.self, from: responseData)
                handler(.success(response))
            } catch {
                handler(.failure(error))
            }
        }
        
        dataTasks.resume()
    }
}

