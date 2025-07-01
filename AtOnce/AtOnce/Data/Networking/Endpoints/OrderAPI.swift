//
//  OrderAPI.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 28/06/2025.
//

import Foundation
import Alamofire

enum OrderAPI: APIRequest {
    case getOrdersByStatus(status: Int, pharmacyId: Int)

    var baseURL: String {
        Constants.baseURL
    }

    var path: String {
        switch self {
        case .getOrdersByStatus(let status, let pharmacyId):
            return "api/Order/getAllOrderByStatus/\(pharmacyId)?status=\(status)"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    var bodyAsDictionary: [String : Any]? {
        nil
    }
}
