//
//  Home.swift
//  UI-315 (iOS)
//
//  Created by nyannyan0328 on 2021/09/23.
//

import SwiftUI

struct Home: View {
    @State var tabs : [Tab] = [
    
    Tab(title: "Get musle plan\nfor pro"),
    Tab(title: "Push up close 50kg"),
    Tab(title: "One arm push up 13kg"),
    Tab(title: "Age 39 but Super amazing power"),
    Tab(title: "176 77 wingspan 187")
    
    
    
    ]
    
    @State var currentIndex : Int = 0
    var body: some View {
        VStack(spacing:0){
            
            
            HStack{
                
                Button {
                    
                    tabs.append(Tab(title: "\(Date().formatted(date: .omitted, time: .standard))"))
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                        .frame(width: 40, height: 40)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.white,lineWidth: 1)
                        )
                }
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                    Text("Skip")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        .opacity(0.3)
                    
                }


            }
            .padding()
          
            .overlay(
            
                HStack{
                    
                    
                    ForEach(tabs.indices,id:\.self){index in
                        
                        Capsule()
                            .fill(Color.white.opacity(currentIndex == index ? 1 : 0.55))
                            .frame(width: currentIndex == index ? 18 : 4, height: 4)
                            .animation(.easeInOut, value: currentIndex)
                        
                        
                    }
                }
            
            )
            
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                
                
                VStack(spacing:20){
                    
                    Text("Perpare Training")
                        .font(.callout.bold())
                        .foregroundStyle(.secondary)
                    
                    
                    Text("Let's Create a\nTraining Plan\nfor you!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .lineSpacing(5.5)
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .top)
                
                
                
                InfinityCarouselView(tabs:$tabs, currentIndex: $currentIndex)
                
                
                
            }
            
            
            HStack{
                
                Text("Next Step")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 7)
                            .strokeBorder(.white,lineWidth: 0.5)
                        
                        )
                    
                    
                }

                
                
            }
            .padding()
            .padding(.bottom,10)
            .padding(.horizontal,30)
            .background(
            
            
                Color.black.clipShape(CustomShape(radius: 30, corner: [.topLeft,.topRight]))
                    .ignoresSafeArea()
            
            )
        
            
            
            
        }
      
        .frame(maxWidth: .infinity, maxHeight: .infinity)
       
        .background(
        
            LinearGradient(colors: [
            
            Color("BG1"),
            Color("BG1"),
            
            
            
            ], startPoint: .top, endPoint: .bottom)
               
        
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
