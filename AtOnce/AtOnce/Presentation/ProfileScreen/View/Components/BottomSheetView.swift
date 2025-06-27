//
//  DetailsView.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import SwiftUI


struct BottomSheetView: View {
    var body: some View {
        VStack{
            ProfileOption(icon: "phone", title: "phone".localized)
            Divider()
            ProfileOption(icon: "phone", title: "phone".localized)
        }.padding()
    }
}
#Preview {
    BottomSheetView()
}
