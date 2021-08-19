//
//  WetherView.swift
//  WetherView
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct WetherView: View {
    var body: some View {
        ZStack{
            
            
           
                LinearGradient(colors: [
                
                    Color("BG1"),
                    Color("BG2")
                    
                
                
                ], startPoint: .top, endPoint: .bottom)
            
                .ignoresSafeArea()
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                
                     Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 100)
                    .offset(x: -size.width / 1.8, y: -size.height / 2)
                
                
                Circle()
               .fill(Color("Purple"))
               .padding(50)
               .blur(radius: 100)
               .offset(x: size.width / 1.8, y: -size.height / 2)
                
                
                Circle()
               .fill(Color("LightBlue"))
               .padding(50)
               .blur(radius: 100)
               .offset(x: size.width / 1.8, y: size.height / 2)
                
                
                Circle()
               .fill(Color("LightBlue"))
               .padding(50)
               .blur(radius: 200)
               .offset(x: size.width / 1.8, y: size.height / 2)
                
                
                Circle()
               .fill(Color("Purple"))
               .padding(50)
               .blur(radius: 100)
               .offset(x: -size.width / 1.8, y: size.height / 2)
                
              
           
           
                
                
                
            }
            
            
            VStack{
                
                Spacer()
                
                ZStack{
                    
                    Circle()
                        .fill(Color("Button11"))
                        .frame(width: 80, height: 80)
                        .blur(radius: 20)
                        .offset(x: 90, y: -120)
                    
                    
                    Circle()
                        .fill(Color("Button11"))
                        .frame(width: 80, height: 80)
                        .blur(radius: 20)
                        .offset(x: -90, y: 120)
                    
                    
                    GlassModfickCard()
                    
                    
                    
                }
                
                Spacer()
                
                Text("Know Everything\nabout the weather")
                    .font(.custom("Better Grade", size: 100))
                   
                
                
                Text(getAttribute())
                    .font(.custom("Better Grade", size: 30))
                    .padding(.top,10)
                
                
                
                Button {
                    
                } label: {
                    
                    Text("Get Started")
                        .font(.custom("Better Grade", size: 30))
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity)
                        .background(
                        
                        LinearGradient(colors: [
                        
                        
                        
                        Color("Button11"),
                        Color("Button12"),
                        Color("Button11"),
                        Color("Button12"),
                        .clear
                        
                        
                        ], startPoint: .leading, endPoint: .trailing),in: RoundedRectangle(cornerRadius: 20)
                        
                        
                        
                        )
                    
                    
                }
                .padding()
            

                
                
                
                
            }
            .padding(.horizontal,50)
            .foregroundColor(.white)
            .padding(.vertical,20)
            .padding(.bottom,70)
           
            
        
            
            
            
        }
    }
    
    func getAttribute()->AttributedString{
        var atR = AttributedString("The most beautiful Image for unsplash")
        atR.foregroundColor = .gray
        
        
        if let lange = atR.range(of: "unsplash"){
            
            atR[lange].foregroundColor = .white
            atR.link = URL(string: "https://unsplash.com")
            
            
        }
        
        return atR
        
        
        
        
    }
}

struct WetherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GlassModfickCard : View{
    
    var body: some View{
        
        let width = UIScreen.main.bounds.width
        
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 25)
                .opacity(0.1)
            
                .background(
                
                    Color.white.opacity(0.1).blur(radius: 10)
                
                )
                .background(
                
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(
                        
                        
                            LinearGradient(colors: [
                                
                                
                                Color("Purple"),
                                Color("Purple").opacity(0.3),
                                .clear,
                                .clear,
                                Color("LightBlue"),
                                
                            
                            
                            
                            
                            
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                        
                        
                        
                        
                        )
                        .padding(2)
                
                
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
            
            VStack{
                
                Image(systemName: "sun.max")
                    .font(.system(size: 100, weight: .ultraLight))
                
                
                Text("18")
                    .font(.custom("Better Grade", size: 100))
                    .foregroundColor(.black)
                    .overlay(
                    
                    Text("C")
                        .font(.title3)
                        .foregroundColor(.orange)
                    
                    
                        .offset(x: 8, y: -13)
                    ,alignment: .topTrailing
                    
                    )
                
                
                Text("TOKYO")
                    .font(.title.weight(.black))
                    .padding(.bottom,5)
                    
            }
            
            
            
            
            
            
            
            
            
                
        }
        .frame(width: width / 1.7, height: 270)
    }
}
