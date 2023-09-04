//  /*
//
//  Project: AnimatedGifs
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.09.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showWebView = false

    var body: some View {
        
        VStack {
            if showWebView {
                AnimatedGIFView(gifName: "200w")
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
            } else {
                Button("Open Fire") {
                    showWebView.toggle()
                }
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .serif))
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimatedGIFView: UIViewRepresentable {
    let gifName: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif") {
            let gifURL = URL(fileURLWithPath: gifPath)
            let request = URLRequest(url: gifURL)
            uiView.load(request)
        }
    }
}
