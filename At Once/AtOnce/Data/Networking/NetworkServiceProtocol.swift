//
//  NetworkServiceProtocol.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//

import Combine
protocol NetworkServiceProtocol {
    func request<T : Decodable>(_request: APIRequest, responseType: T.Type)-> AnyPublisher<T,Error>
}
