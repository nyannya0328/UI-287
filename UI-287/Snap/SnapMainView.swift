//
//  SnapMainView.swift
//  SnapMainView
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct SnapMainView: View {
    @State var posts : [Post] = []
    @State var currentIndex : Int = 0
    
    @State var currentTab = "Slide now"
    @Namespace var animation
    var body: some View {
        VStack(spacing:15){
            
            VStack{
                
                Button {
                    
                } label: {
                    
                    Label {
                        
                        Text("Back")
                        
                    } icon: {
                        Image(systemName: "chevron.left")
                    }
                    .font(.title.italic())
                    .foregroundColor(.black)
                    .offset(x: -8)

                    
                }
                
                Text("My Wishes")
                    .fontWeight(.black)
                
            

                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(spacing:0){
                
                SnapTabButton(title: "Slide now", currentTab: $currentTab, animation: animation)
                
                SnapTabButton(title: "List", currentTab: $currentTab, animation: animation)
                
                
            }
            .background(Color.black.opacity(0.03))
            .padding(.horizontal)
            
            
            
            
            SnapCarousel(spacing:50,index: $currentIndex, items: posts) {post in
                
                
                GeometryReader{proxy in
                    
                    
                    let size = proxy.size
                    
                    
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(10)
                }
                
                
                
                
            }
            .padding(.vertical,40)
            
            HStack{
                
                
                ForEach(posts.indices,id:\.self){index in
                    
                    
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 15, height: 15)
                        .scaleEffect(currentIndex == index ? 1.5 : 1)
                        .animation(.spring(), value: currentIndex == index )
                }
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            
            for index in 1...6{
                
                posts.append(Post(postImage: "p\(index)"))
                
            }
            }
        }
    }


struct SnapMainView_Previews: PreviewProvider {
    static var previews: some View {
        SnapMainView()
    }
}

struct SnapTabButton : View{
    
    var title : String
    @Binding var currentTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            
            withAnimation{
                
                currentTab = title
            }
            
        } label: {
            
            
            Text(title)
                .font(.custom("Better Grade", size: 40))
                .foregroundColor(currentTab == title ? .white : .black)
                .padding(.vertical,12)
                .padding(.horizontal,10)
                .frame(maxWidth: .infinity)
                .background(
                
                
                    ZStack{
                        
                        if currentTab == title{
                            
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TABB", in: animation)
                        }
                    }
                
                )
            
            
        }

        
    }
}
