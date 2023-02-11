//
//  ContentView.swift
//  Shared
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color("backgroundColor")
            //.edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.all)
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 0.0)
                
                Spacer()
                Spacer()
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.white)
                        .foregroundColor(Color.purple)
                        .frame(width: 350, height: 50)
                    Text("Enter ZIP Code or Location")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(Color.gray)
                }
                    
                Button(action: DoneButton){
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.gray)
                            .frame(width: 100, height: 30)
                        Text("Done").foregroundColor(Color.white)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        }
                }.padding(.bottom, 275)
                    
                
                    
                }
            }
        }
        
        func DoneButton(){
            print("Student Button Works!")
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
