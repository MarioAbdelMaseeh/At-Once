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
    @State private var activeAlert: SupplierAlert?
    
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
                    if viewModel.isLoading{
                        ProgressView()
                    }else{
                        ForEach(viewModel.suppliersProduct) { product in
                            
                            SuppliersProductCard(suppliersProduct: product, isLoading: viewModel.loadingProductIds.contains(product.medicineId)){ p in
                                viewModel.addToCart(p: p)
                            }
                        }
                    }
                }
                .padding()
            }
            
        }
        .alert(item: $activeAlert) { alert in
            switch alert {
            case .message(let msg):
                return Alert(title: Text(msg))
            }
        }
        .onReceive(viewModel.$errorMessage.compactMap { $0 }) { msg in
            activeAlert = .message(msg)
        }
        .onReceive(viewModel.$successMessage.compactMap { $0 }) { msg in
            activeAlert = .message(msg)
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .onAppear {
            viewModel.loadSuppliersProduct( productId: productId)
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
