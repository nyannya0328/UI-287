//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct CustomTabBar: View {
    var animation : Namespace.ID
    @Binding var currentTab : Tab
    
    var size : CGSize
    var botttomEdge : CGFloat
    
    @State var startAnimation = false
    var body: some View {
        HStack(spacing:0){
            
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                
                TabButton(currentTab: $currentTab, tab: tab, animation: animation) { pressTab in
                    
                    
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                        
                        
                       startAnimation = true
                        
                    }
                    
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                        
                        
                        currentTab = pressTab
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                            
                            
                            startAnimation = false
                            
                        }
                        
                    }
                    
                }
            }
        }
        .background(
        
            ZStack{
                
                let animationOffset : CGFloat = (startAnimation ? (startAnimation ? 15 :18) : (botttomEdge == 0 ? 26 : 27))
                
                let offset : CGSize = botttomEdge == 0 ? CGSize(width: animationOffset, height: 31) : CGSize(width: animationOffset, height: 36)
                
                
                Circle()
                    .fill(Color("red"))
                    .frame(width: 50, height: 50)
                    .offset(y: 40)
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .scaleEffect(botttomEdge == 0 ? 0.85 : 1)
                    .offset(x: offset.width, y: offset.height)
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .scaleEffect(botttomEdge == 0 ? 0.85 : 1)
                    .offset(x: -offset.width, y: offset.height)
            }
                .offset(x: getStartOffset())
                .offset(x: getOffset())
            
            ,alignment: .leading
        
        
        )
        .padding(.top,10)
        .padding(.horizontal)
        .padding(.bottom,botttomEdge == 0 ? 25 : botttomEdge)
    }
    
    func getStartOffset()->CGFloat{
        
        let reduced = (size.width - 50) / 4
        let center = (reduced - 45) / 2
        
        return center
    }
    
    func getOffset()->CGFloat{
        
        
        let reduced = (size.width - 30) / 4
        let index = Tab.allCases.firstIndex { checkTab in
            return checkTab == currentTab
        } ?? 0
        
        return reduced * CGFloat(index)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct TabButton : View{
    
    @Binding var currentTab : Tab
    
    var tab : Tab

    var animation : Namespace.ID
    var ontap : (Tab)->()
    
    
    var body: some View{
        Image(systemName: tab.rawValue)
            .font(.title2.weight(.ultraLight))
            .foregroundColor(currentTab == tab ? .accentColor : .gray)
            .frame(width: 50, height: 50)
            .background(
            
                ZStack{
                    
                    if currentTab == tab{
                        
                        
                        Circle()
                            .fill(Color("red"))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            
            )
            .frame(maxWidth: .infinity)
            .onTapGesture {
                if currentTab != tab{
                    
                    ontap(tab)
                    
                }
            }
    }
    
}
