//
//  CarouselTabView.swift
//  CarouselTabView
//
//  Created by nyannyan0328 on 2021/08/17.
//

import SwiftUI

struct CarouselTabView: View {
    var index : Int
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            
            ZStack{
                
                
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height / 1.5)
                    .cornerRadius(10)
                    .offset(y: -40)
                   
                
                
                VStack{
                    
                    VStack{
                        
                        
                        
                        Text("Human Intaergration Super Viser")
                            .foregroundStyle(.gray)
                        
                        
                        Text("Animal Amazing!")
                            .foregroundStyle(.orange)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    .padding(.top,10)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment:.leading,spacing:10){
                        
                        
                        HStack{
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            
                            VStack{
                                
                                
                                Text("Girl")
                                    .font(.title3.weight(.thin))
                                    .foregroundStyle(.secondary)
                                
                                
                                Text("CUTE")
                                    .font(.headline.weight(.black))
                                    .foregroundStyle(.secondary)
                            }
                            
                            
                            
                        }
                        
                        HStack{
                            
                            
                            VStack(spacing:15){
                                
                                Text("1300")
                                    .font(.title)
                                    .foregroundColor(.secondary)
                                
                                
                                Text("Posts")
                                    .font(.title2.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack(spacing:15){
                                
                                Text("500k")
                                    .font(.title)
                                    .foregroundColor(.secondary)
                                
                                
                                Text("Follower")
                                    .font(.title2.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack(spacing:15){
                                
                                Text("0")
                                    .font(.title)
                                    .foregroundColor(.secondary)
                                
                                
                                Text("Follower")
                                    .font(.title2.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    .padding(20)
                    .padding(.horizontal)
                    .background(.white,in: RoundedRectangle(cornerRadius: 10))
                    
                    
                
                    
                    
                }
                .frame(width: size.width - 30, height: size.height / 1.5)
                
                
    
                
                
                
                
            }
            .frame(width: size.width - 30, height: size.height / 1.5)
            .frame(width: size.width, height: size.height)
            
            .rotation3DEffect(.init(degrees: getprogress() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset < 0 ? .trailing : .leading, anchorZ: 0, perspective: 1)
            
            .modifier(offsetModfier(offset: $offset, anchorPoint: .leading))
           
            
            
        }
        .tag("p\(index)")
    }
    
    func getprogress()->CGFloat{
        
        let progess = -offset / UIScreen.main.bounds.width
        
        return progess
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        RotationMainView()
    }
}
