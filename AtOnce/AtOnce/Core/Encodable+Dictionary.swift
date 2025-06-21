//
//  Encodable+Dictionary.swift.swift
//  At Once
//
//  Created by mac on 21/06/2025.
//
import Foundation
extension Encodable {
    func asDictionary() throws-> [String : Any]{
        let data = try JSONEncoder().encode(self)
        return try JSONSerialization.jsonObject(with: data) as? [String : Any] ?? [:]
    }
}
