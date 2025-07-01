//
//  WebView.swift
//  At Once
//
//  Created by mac on 19/06/2025.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebViewScreen: View {
    var url:String
    var title: String
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        
        VStack{
            WebView(url: URL(string: url )!)
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.mainPath.removeLast()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text(NSLocalizedString("back", comment: ""))
                        }
                    }
                }
                ToolbarItem(placement: .principal){
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
            .toolbar {
                
            }
        
        
    }
}

#Preview {
    WebViewScreen(url: "https://atonce2025.blogspot.com/2025/06/frequently-asked-questions-body-font.html",title: "Commen Questions")
}

