//
//  SnapCarousel.swift
//  SnapCarousel
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct SnapCarousel<Content : View,T : Identifiable>: View {
    
    var content : (T) -> Content
    var list : [T]
    var trailingSpace : CGFloat
    @Binding var index : Int
    var spacing : CGFloat
    
    init(trailingSpace : CGFloat = 100,spacing : CGFloat = 15,index : Binding<Int>,items : [T],@ViewBuilder content : @escaping(T) ->Content) {
      
        
        self.spacing = spacing
        self._index = index
        self.trailingSpace = trailingSpace
        self.list = items
        self.content = content
    
        
        
    }
    
    @GestureState var offset : CGFloat = 0
    
    @State var currentIndex : Int = 0
    
    
    
    var body: some View {
        GeometryReader{proxy in
            
            let width = proxy.size.width - (trailingSpace - spacing)
            
            let adustWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing:spacing){
                
                ForEach(list){item in
                    
                    
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                       
                }
                
            }
            .padding(.horizontal,spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adustWidth : 0) + offset)
            .gesture(
            
                DragGesture().updating($offset, body: { value, out, _ in
                    
                    
                    out = value.translation.width
                    
                })
                    .onEnded({ value in
                        
                        
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let rounIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(rounIndex), list.count - 1), 0)
                        currentIndex = index
                        
                    })
                    .onChanged({ value in
                        
                        
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let rounIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(rounIndex), list.count - 1), 0)
                      
                        
                    })
            
            )
        }
        .animation(.easeInOut, value: offset == 0)
       
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        SnapMainView()
    }
}
