//
//  DragMainVie.swift
//  DragMainVie
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct DragMainVie: View {
   var topEdge : CGFloat
    var body: some View {
        VStack(spacing:15){
            
            HStack{
                
                Text("DragMain")
                    .font(.largeTitle.weight(.black))
                
                
                Spacer()
                
                
                Image(systemName: "person.fill")
                    .font(.title.bold())
                    .overlay(
                
                        Circle()
                            .fill(.red)
                            .frame(width: 15, height: 15)
                            .offset(x: 5, y: -8)
                        
                        ,alignment: .topTrailing
                    
                    )
                    
                
                
                
            }
            .padding(.horizontal)
            
            GeometryReader{proxy in
                
                let size = proxy.size
                VerticalCarousel {
                    
                    
                    
                    VStack{
                        
                        
                        ForEach(animals){animal in
                            
                            AnimalCardView(animal: animal, topoffset: 70 + 15)
                                .frame(height: size.height)
                               
                            
                        }
                    }
                }
               
                
                
                
            }
            
            
        }
    }
}

struct DragMainVie_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCardView : View{
    
    var animal : Animal
    
    var topoffset : CGFloat
    
    var body: some View{
        
        
        
        GeometryReader{proxy in
            
            
            let size = proxy.size
            
            let minY = proxy.frame(in: .global).minY + topoffset
            
            let progress = -minY / size.height
            
            let scale = 1 - (progress / 3)
            
        
            let opacity = 1 - progress
            
            ZStack{
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
            }
            .padding(.horizontal,15)
            .cornerRadius(15)
            .scaleEffect(minY < 0 ? scale : 1)
            .offset(y: minY < 0 ? -minY : 0)
            .opacity(minY < 0 ? opacity : 1)
            
            
            
        }
    }

}
