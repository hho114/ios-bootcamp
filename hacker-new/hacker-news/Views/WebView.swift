//
//  WebView.swift
//  hacker-news
//
//  Created by Alex Ho on 10/23/20.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
