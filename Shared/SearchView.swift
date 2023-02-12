//
//  SearchView.swift
//  SwiftEZ (iOS)
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
struct SearchView: View {
    @State var artistsearch: String = ""
    @State var selection: String = ""
    var options = ["Taylor Swift", "The Weeknd", "Harry Styles"]
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("backgroundColor"))
                .frame(width: 390, height: 844)
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                            
                    TextField("Enter your favorite artist here", text: $artistsearch)
                        .padding([.trailing, .leading], 20)
                        .padding([.top, .bottom], 10)
                        .background(Color(UIColor.white))
                        .cornerRadius(13)
                        .padding([.trailing, .leading], 40)
                        .font(Font.system(size: 20, weight: .regular, design: .rounded))
                    
                    Spacer()
                
                }
                
                Image("TSwift")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.trailing, .leading], 40)
                    .padding(15)
                
                
            }
            
            
            
            
            
            
        }
    }
        
}
