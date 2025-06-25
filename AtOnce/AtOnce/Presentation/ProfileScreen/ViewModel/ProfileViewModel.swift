//
//  ProfileViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 24/06/2025.
//
import Combine

protocol ProfileViewModelProtocol{
    func loadPharmacy() 
}


class ProfileViewModel:ProfileViewModelProtocol, ObservableObject {
    @Published var pharmacy: CachedPharmacy?

    private let cacheUseCase: CachePharmacyUseCase

    init(cacheUseCase: CachePharmacyUseCase) {
        self.cacheUseCase = cacheUseCase
        loadPharmacy()
    }

    func loadPharmacy() {
        self.pharmacy = cacheUseCase.getCachedUser()
    }
}
