//
//  AuthAPI.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Alamofire
enum AuthAPI: APIRequest {
    case login(email: String, password: String)
    
    var baseURL: String {
        "http://www.pharmaatoncepredeploy.somee.com/"
    }

    var path: String {
        switch self {
        case .login:
            return "api/Pharmacy/login"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var bodyAsDictionary: [String: Any]? {
        switch self {
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        }
    }
}
