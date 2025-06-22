//
//  ViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//

import Combine

protocol LoginScreenViewModelProtocol{
    func login(email: String, password: String)
}

class LoginScreenViewModel:LoginScreenViewModelProtocol, ObservableObject {
    @Published var loginResponse: LoginResponse?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    
   private let useCase : LoginUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: LoginUseCase) {
        self.useCase = useCase
    }
    
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        useCase.execute(email: email, password: password)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.loginResponse = response
                
                print(response)
            }
            .store(in: &cancellables)
    }
    
}

   
