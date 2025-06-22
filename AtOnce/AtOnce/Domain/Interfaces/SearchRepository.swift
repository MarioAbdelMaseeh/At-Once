//
//  SearchRepository.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine

protocol SearchRepository{
    func getProductsByText(text: String, page: Int, pageSize: Int)-> AnyPublisher<[SearchProduct], Error>
}
