//
//  SearchUseCase.swift
//  AtOnce
//
//  Created by mac on 22/06/2025.
//

import Combine
protocol SearchUseCase{
    func excute(area: Int, text: String, page: Int, pageSize: Int)-> AnyPublisher<[SearchProduct], Error>
}
class SearchUseCaseImpl: SearchUseCase{
    let repo: SearchRepository
    init(repo: SearchRepository) {
        self.repo = repo
    }
    func excute(area: Int, text: String, page: Int, pageSize: Int) -> AnyPublisher<[SearchProduct], any Error> {
        repo.getProductsByText(area: area, text: text, page: page, pageSize: pageSize)
    }
}
