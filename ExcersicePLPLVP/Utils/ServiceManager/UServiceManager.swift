//
//  UServiceManager.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import Foundation
import Alamofire

/// `UServiceManager` es una clase singleton que facilita la comunicación con servicios web.
/// Se utiliza para realizar solicitudes HTTP y decodificar respuestas en modelos `Decodable`.
public class UServiceManager {
    
    /// Instancia compartida del `UServiceManager`.
    public static let shared = UServiceManager()
    
    /// Constructor privado para prevenir la instanciación directa y garantizar el uso de la instancia compartida.
    private init() {}

    /// Método genérico para realizar una solicitud HTTP y decodificar la respuesta en un modelo `Decodable`.
        ///
        /// - Parameters:
        ///   - baseUrl: La URL base del servicio (por defecto apunta al servicio de plp lvp).
        ///   - queryParam: Parámetros de consulta para modificar la solicitud.
        ///   - method: Método HTTP a utilizar (GET, POST, etc.).
        ///   - completion: Closure que devuelve un `Result<T, Error>` con el objeto decodificado o un error en caso de fallo.
    internal func callService<T: Decodable>(
        baseUrl: String = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp",
        queryParam: String,
        method: HTTPMethod = .get,
        success: @escaping (T?) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        // Realiza la solicitud HTTP utilizando Alamofire
        DispatchQueue.global(qos: .background).async {
            AF.request("\(baseUrl)\(queryParam)", method: method).responseData { response in
                switch response.result {
                    case .success(let data):
                        do {
                            let decoder: JSONDecoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            let decodedData = try decoder.decode(T.self, from: data)
                            DispatchQueue.main.async {
                                success(decodedData)
                            }
                        } catch let decodingError as DecodingError {
                            DispatchQueue.main.async {
                                failure(decodingError)
                            }
                        } catch {
                            DispatchQueue.main.async {
                                failure(error)
                            }
                        }
                    case .failure(let err):
                        DispatchQueue.main.async {
                            failure(err)
                        }
                    }
            }
        }
    }
}
