//
//  AuthAPI.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 21/06/2025.
//
import Alamofire
enum AuthAPI: APIRequest {
    case login(email: String, password: String)
    case registerRequest(request: RegisterRequestDTO)
    case forgetPassword(email: String, OTP: String)
    case restPassword(email: String, OTP: String, newPassword: String, confirmPassword: String)
    case getAllGovernorates
    case getAllAreasByGovernorateId(governorateId:Int)
    
    var baseURL: String {
        Constants.baseURL
    }

    var path: String {
        switch self {
        case .login:
             "api/Pharmacy/login"
        case .registerRequest:
             "api/Pharmacy/register"
        case .forgetPassword:
             "api/Pharmacy/forgot-password"
        case .restPassword:
             "api/Pharmacy/reset-password"
        case .getAllGovernorates:
            "api/Pharmacy/register"
        case .getAllAreasByGovernorateId(governorateId: let governorateId):
            "api/Pharmacy/register?governateId=\(governorateId)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            .post
        case .registerRequest:
            .post
        case .forgetPassword:
            .post
        case .restPassword:
            .post
        case .getAllGovernorates:
            .get
        case .getAllAreasByGovernorateId(governorateId: _):
            .get
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var bodyAsDictionary: [String: Any]? {
        switch self {
        case .login(let email, let password):
            [
                "email": email,
                "password": password
            ]
        case .registerRequest(let request):
            [
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
        case .forgetPassword(email: let email, OTP: let OTP):
            [
                "email": email,
                "otp": OTP
            ]
        case .restPassword(email: let email, OTP: let OTP, newPassword: let newPassword, confirmPassword: let confirmPassword):
            [
                "email": email,
                "otp": OTP,
                "newPassword": newPassword,
                "confirmPassword": confirmPassword
            ]
        case .getAllGovernorates:
            nil
        case .getAllAreasByGovernorateId(governorateId: let governorateId):
            nil
        }
    }
}
