//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct Home: View {
    
    var size : CGSize
    var botttomEdge : CGFloat
    
    
    @State var currentTab : Tab = .Search
    
    init(size : CGSize,botttomEdge : CGFloat) {
        self.size = size
        self.botttomEdge = botttomEdge
        
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    var body: some View {
        ZStack(alignment:.bottom){
            
            TabView(selection:$currentTab){
                
                
                RotationMainView()
                    .tag(Tab.Home)
                
                GeometryReader{proxy in
                    
                    let topEdge = proxy.safeAreaInsets.top
                    
                    DragMainVie(topEdge: topEdge)
                    
                }
                    
                    .tag(Tab.Search)
                
            WetherView()
                   
                    .tag(Tab.Heart)
                
                SnapMainView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                    .tag(Tab.Settings)
            }
            
            CustomTabBar(animation: animation, currentTab: $currentTab, size: size, botttomEdge: botttomEdge)
                .background(.white)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab :String, CaseIterable{
    
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Heart = "suit.heart.fill"
    case Settings = "gearshape"
    
}


