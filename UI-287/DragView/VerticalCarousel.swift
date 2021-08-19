//
//  VerticalCarousel.swift
//  VerticalCarousel
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct VerticalCarousel<Content : View>: UIViewRepresentable {
    var content : Content
    
    
    init(@ViewBuilder content : @escaping()->Content) {
        self.content = content()
    }
    
    
    
    let scroll = UIScrollView()
    
    
    func makeUIView(context: Context) -> UIScrollView {
        
        setUP(scroll: scroll)
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func setUP(scroll : UIScrollView){
        
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        
     let hostView = UIHostingController(rootView: content)
        
        hostView.view.backgroundColor = .clear
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let contains = [
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hostView.view.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
        
        
        ]
        
       
        scroll.addSubview(hostView.view)
        scroll.addConstraints(contains)
     
        
        
    }
}

