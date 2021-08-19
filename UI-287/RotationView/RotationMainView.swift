//
//  RotationMainView.swift
//  RotationMainView
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct RotationMainView: View {
    @State var currentTab = "p1"
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                
                let size = proxy.size
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            TabView(selection:$currentTab){
                
                
                
                ForEach(1...6,id:\.self){index in
                    
                    CarouselTabView(index: index)
                    
                    
                }
                
                
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct RotationMainView_Previews: PreviewProvider {
    static var previews: some View {
        RotationMainView()
    }
}
