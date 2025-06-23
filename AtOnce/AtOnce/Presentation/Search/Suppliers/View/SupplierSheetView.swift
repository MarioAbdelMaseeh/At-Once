//
//  SupplierSheetView.swift
//  At Once
//
//  Created by Iman Mahmoud on 18/06/2025.
//

import SwiftUI

struct SupplierSheetView: View {
    @StateObject var viewModel: SuppliersScreenViewModel
    
    let productId : Int
    let productImage : String
    
    init(productId : Int, productImage : String) {
        self.productId = productId
        self.productImage = productImage
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

                Text("Panadol Extra 600mg")
                    .font(.title2.bold())
                Spacer()
            }
            .padding(.horizontal)

            Divider()

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.suppliersProduct) { product in
                       SuppliersProductCard(suppliersProduct: product)
                    }
                }
                .padding()
            }
            
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .onAppear {
            viewModel.loadSuppliersProduct(areaId: 2, ProductId: 3/*productId*/)
        }
        
    }
}


//#Preview {
//    SupplierSheetView()
//}
