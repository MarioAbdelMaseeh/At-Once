//
//  RegisterRequestAPI.swift
//  AtOnce
//
//  Created by Adham Mohamed on 24/06/2025.
//

import Foundation
import Alamofire

enum RegisterRequestAPI: APIRequest {
    case registerRequest(request: RegisterRequestDTO)
    
    var baseURL: String {
        return "http://www.pharmaatoncepredeploy.somee.com/"
    }

    var path: String {
        switch self {
        case .registerRequest:
            return "api/Pharmacy/register"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .registerRequest:
            return .post
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var bodyAsDictionary: [String: Any]? {
        switch self {
        case .registerRequest(let request):
            return [
                "userName": request.userName,
                "name": request.name,
                "email": request.email,
                "password": request.password,
                "confirmPassword": request.confirmPassword,
                "address": request.address,
                "governate": request.governate,
                "areaId": request.areaId,
                "representativeCode": request.representativeCode,
                "phoneNumber": request.phoneNumber
            ]
        }
    }
}
