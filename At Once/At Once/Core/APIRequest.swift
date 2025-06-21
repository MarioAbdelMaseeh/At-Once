//
//  APIRequest.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//


import Alamofire

protocol APIRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var bodyAsDictionary: [String: Any]? { get }
}
