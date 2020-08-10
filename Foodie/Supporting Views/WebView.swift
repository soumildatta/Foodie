//
//  WebView.swift
//  Foodie
//
//  Created by Soumil Datta on 8/10/20.
//  Copyright © 2020 Soumil Datta. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = url {
            if let finalUrl = URL(string: safeUrl) {
                let request = URLRequest(url: finalUrl)
                uiView.load(request)
            }
        }
    }
}
