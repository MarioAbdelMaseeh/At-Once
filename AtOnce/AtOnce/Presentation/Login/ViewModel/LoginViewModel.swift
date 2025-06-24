//
//  ViewModel.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 22/06/2025.
//
import SwiftUI
import Combine

protocol LoginScreenViewModelProtocol{
    func login(email: String, password: String)
}

class LoginScreenViewModel:LoginScreenViewModelProtocol, ObservableObject {
//    @Published var email: String = "" {
//            didSet {
//                validateEmail()
//            }
//        }
//
//        @Published var password: String = "" {
//            didSet {
//                validatePassword()
//            }
//        }
    
    
    
    
    @Published var loginResponse: LoginResponse?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var passwordError : String?
    @Published var emailError : String?
    
    @Published var loginSuccess: Bool?
    
   // var pharmacyName: CachedPharmacy?
    
    
    
   private let useCase : LoginUseCase
    let cachePharmacyUseCase: CachePharmacyUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: LoginUseCase ,cachePharmacyUseCase: CachePharmacyUseCase) {
        self.useCase = useCase
        self.cachePharmacyUseCase = cachePharmacyUseCase
        
//        guard let pharmacyName = cachePharmacyUseCase.getCachedUser() else {
//            return
//        }
//     
//        self.pharmacyName = pharmacyName
//        print(pharmacyName)
        
        
    }
    
    func login(email: String, password: String) {
        
        validateEmail(email: email)
        validatePassword(password: password)

        guard emailError == nil, passwordError == nil else {
            return
        }
               
        isLoading = true
        errorMessage = nil
        
        useCase.execute(email: email, password: password)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                    self?.loginSuccess = false
                }
            } receiveValue: { [weak self] response in
                self?.loginResponse = response
                if response.success {
                    self?.loginSuccess = true
                    self?.cachePharmacy(loginResponse: response)
                  //  self?.savePharmacy(response.pharmacy)
                } else {
                    self?.errorMessage = response.message
                    self?.loginSuccess = false
                }
                                   
                print(response)
            }
            .store(in: &cancellables)
    }
    
    
    private func validateEmail(email:String) {
            if email.trimmingCharacters(in: .whitespaces).isEmpty {
                emailError = NSLocalizedString("email_required", comment: "")
            } else {
                emailError = nil
            }
        }

    private func validatePassword(password:String) {
            if password.trimmingCharacters(in: .whitespaces).isEmpty {
                passwordError = NSLocalizedString("password_required", comment: "")
            } else {
                passwordError = nil
            }
        }
    
    func cachePharmacy(loginResponse:LoginResponse){
        let cachedUser = CachedPharmacy(user: loginResponse.pharmacy, token: loginResponse.token)
        cachePharmacyUseCase.cacheUser(user: cachedUser)
    }
    

    
}

   
