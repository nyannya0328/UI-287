//
//  ContentView.swift
//  UI-287
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        GeometryReader{proxy in
            
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            Home(size: size, botttomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

