//
//  NetworkService.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//
import Foundation
import Combine
import Alamofire

class NetworkService: NetworkServiceProtocol{
    func request<T>(_request: APIRequest, responseType: T.Type) -> AnyPublisher<T, any Error> where T : Decodable {
        let url = _request.baseURL + _request.path
        let headers = HTTPHeaders(_request.headers ?? [:])
        let encoding: ParameterEncoding = _request.method == .get ? URLEncoding.default : JSONEncoding.default
        
        return Future<T,Error>{ promise in
            AF.request(
                url,
                method: _request.method,
                parameters: _request.bodyAsDictionary,
                encoding: encoding,
                headers: headers
            ).validate()
                .responseDecodable(of: T.self) { response in
                    switch(response.result){
                        case .success(let data):
                            promise(.success(data))
                        case .failure(let error):
                            print(error )
                            promise(.failure(error))
                    }
                }
        }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
