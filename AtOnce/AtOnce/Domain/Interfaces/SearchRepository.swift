//
//  SearchRepository.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine

protocol SearchRepository{
    func getProductsByText(area: Int, text: String, page: Int, pageSize: Int, type: String)-> AnyPublisher<[SearchProduct], Error>
}
