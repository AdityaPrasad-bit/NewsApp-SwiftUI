//
//  WebView.swift
//  H4X0R News
//
//  Created by Apple on 25/10/22.
//

import Foundation
import WebKit
import SwiftUI


//MARK: - Q)What is UIViewRepresenatable?
//A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.
struct WebView:UIViewRepresentable{
    let urlString:String?
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url:url)
                uiView.load(request)
            }
        }
    }
}
