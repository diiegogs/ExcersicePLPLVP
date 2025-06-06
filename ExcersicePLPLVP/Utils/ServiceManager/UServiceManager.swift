//
//  UServiceManager.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import Foundation
import Alamofire

public class UServiceManager {
    public static let shared = UServiceManager()
    
    private init() {}
    
    internal func callService<T: Decodable>(
        baseUrl: String = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?",
        url: String = "",
        method: HTTPMethod = .get,
        success: @escaping (T?) -> Void,
        failure: @escaping (Error) -> Void
    ) -> Void {
        print("URL: \(baseUrl+url)")
        AF.request(
            (baseUrl+url),
            method: method
        ).responseData { response in
            DispatchQueue.global(qos: .background).async {
                switch response.result {
                case .success(let data):
                    do {
                        let decodeData = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            success(decodeData)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            failure(error)
                        }
                    }
                    break;
                case .failure(let err):
                    DispatchQueue.main.async {
                        failure(err)
                    }
                }
            }
        }
    }
}
