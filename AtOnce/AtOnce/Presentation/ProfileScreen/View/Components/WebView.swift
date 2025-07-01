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
    var body: some View {
        
        VStack{
            WebView(url: URL(string: url )!)
        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        
        
    }
}

#Preview {
    WebViewScreen(url: "https://atonce2025.blogspot.com/2025/06/frequently-asked-questions-body-font.html",title: "Commen Questions")
}

