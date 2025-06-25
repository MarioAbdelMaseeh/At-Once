//
//  SupplierSheetView.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SupplierSheetView: View {
    @StateObject var viewModel: SuppliersScreenViewModel
    
    @EnvironmentObject var languageManager: LanguageManager
    
    let productId : Int
    let productImage : String
    let productName : String
    
    init(productId : Int, productImage : String, productName : String) {
        self.productId = productId
        self.productImage = productImage
        self.productName = productName
        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(SuppliersScreenViewModelProtocol.self)! as! SuppliersScreenViewModel)
    }
    
    
    
    
    var body: some View {
        VStack(spacing: 8) {

            HStack {
                Image(.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal,8)

                Text(productName)
                    .font(.title2.bold())
                Spacer()
            }
            .padding(.horizontal)

            Divider()

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.suppliersProduct) { product in
                        SuppliersProductCard(suppliersProduct: product){
                            viewModel.addToCart(p: product)
                        }
                    }
                }
                .padding()
            }
            
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .onAppear {
            viewModel.loadSuppliersProduct(areaId: 2, ProductId: 3/*productId*/)
        }.environment(\.layoutDirection, layoutDirection(for: languageManager.currentLanguage))
        
    }
    
    private func layoutDirection(for language: AppLanguage) -> LayoutDirection {
        switch language {
        case .arabic:
            return .rightToLeft
        case .english, .system:
            return .leftToRight
        }
    }
}


//#Preview {
//    SupplierSheetView()
//}
