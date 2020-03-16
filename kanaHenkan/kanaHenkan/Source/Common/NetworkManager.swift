//
//  NetworkManager.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/17.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit
import Alamofire

final class NetworkManager: NSObject {
    static let shared = NetworkManager()
    
    private override init() {}
    
    func requestConvert(beforeStr: String, completion: @escaping (Result<Convert, APIError>) -> Void) {
        
        let parameters = [
            "app_id": "4ad24a2713c1525039b1f9c2f5993caf1e17989e598df81a3caf80f5fab0c567",
            "sentence": beforeStr,
            "output_type": "hiragana"
        ]
        
        AF.request("https://labs.goo.ne.jp/api/hiragana",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (dataResponse) in
                DispatchQueue.main.async {
                    if let error = dataResponse.error {
                        completion(.failure(.network(error.localizedDescription)))
                        return
                    }
                    
                    if dataResponse.response?.statusCode != 200 {
                        completion(.failure(.server))
                        return
                    }
                    
                    guard let data = dataResponse.data else {
                        completion(.failure(.notData))
                        return
                    }
                    
                    if let result = try? JSONDecoder().decode(Convert.self, from: data) {
                        completion(.success(result))
                        return
                    }
                    completion(.failure(.invalidJSON))
                }
        }
    }
}

public enum APIError: Swift.Error {
    case network(String)
    case server
    case notData
    case invalidJSON
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .network(let description):
            return description
        case .server:
            return "サーバーと通信できません。"
        case .notData:
            return "データなし"
        case .invalidJSON:
            return "JSONパース失敗"
        }
    }
}

public enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

