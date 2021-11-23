//
//  InfinityCarouselView.swift
//  UI-315 (iOS)
//
//  Created by nyannyan0328 on 2021/09/23.
//

import SwiftUI

struct InfinityCarouselView: View {
    @Binding var tabs : [Tab]
    @Binding var currentIndex : Int
    
    @State var fakeIndex : Int = 0
    
    
    @State var offset : CGFloat = 0
    
    @State var gnericTabs : [Tab] = []
    
    
    var body: some View {
        TabView(selection: $fakeIndex) {
            
            ForEach(gnericTabs){tab in
                
                
                VStack(spacing:10){
                    
                    
                    Spacer()
                    
                    
                    Text("Your Condition")
                        .font(.title3.bold())
                        .foregroundColor(.gray)
                    
                    
                    Text(tab.title)
                        .font(.largeTitle.bold())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 75, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                        .padding(.bottom)
                    
    
                    Spacer()
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .clipShape(CustomCardShape())
                .cornerRadius(30)
                .padding(.horizontal,30)
                .padding(.top,20)
                .overlay(
                
                
                    GeometryReader{proxy in
                        
                        
                        
                        Color.clear
                            .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minX)
                        
                    }
                
                
                )
                .onPreferenceChange(OffsetKey.self, perform: { offset in
                    self.offset = offset
                })
                .tag(getIndex(tab: tab))
              
                
                
                
                
                
                
                
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 350)
        .onChange(of: offset) { newValue in
            
            
            
            if fakeIndex == 0 && offset == 0{
                
                fakeIndex = gnericTabs.count - 2
                
                
            }
            
            if fakeIndex == gnericTabs.count - 1 && offset == 0{
                fakeIndex = 1
                
                
            }
            
            
            
        }
        .onAppear {
            
            gnericTabs = tabs
            
            
            guard var firist = gnericTabs.first else{return}
            
            guard var end = gnericTabs.last else{return}
            
            
            firist.id = UUID().uuidString
            end.id = UUID().uuidString
            
            gnericTabs.append(firist)
            gnericTabs.insert(end, at: 0)
            
            fakeIndex = 1
            
            
        }
        .onChange(of: tabs) { newValue in
            gnericTabs = tabs
            
            guard var firist = gnericTabs.first else{return}
            
            guard var end = gnericTabs.last else{return}
            
            
            firist.id = UUID().uuidString
            end.id = UUID().uuidString
            
            gnericTabs.append(firist)
            gnericTabs.insert(end, at: 0)
            
            //fakeIndex = 1
            
            
            
        }
        .onChange(of: fakeIndex) { newValue in
            
            currentIndex = fakeIndex - 1
            
        }
    }
    
    func getIndex(tab : Tab)->Int{
        
        let index = gnericTabs.firstIndex { currentTab in
            return tab.id == currentTab.id
        } ?? 0
        
        return index
    }
}

struct InfinityCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey : PreferenceKey{
    
static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        
        value = nextValue()
        
        
    }
}
