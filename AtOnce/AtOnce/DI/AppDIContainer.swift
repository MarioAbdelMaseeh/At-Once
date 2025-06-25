//
//  AppDIContainer.swift
//  AtOnce
//
//  Created by mac on 21/06/2025.
//
import Swinject

class AppDIContainer{
    static let shared = AppDIContainer()
    let container = Container()
    
    private init(){
        registerServices()
        container.registerHome()
        container.registerProduct()
        container.registerAuth()
        container.registerSearch()
        container.registerCart()
        container.registerLanguage()
    }
    
    private func registerServices(){
        container.register(NetworkServiceProtocol.self) { _ in NetworkService() }
    }
    
}
