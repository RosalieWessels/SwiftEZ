//
//  RefundView.swift
//  SwiftEZ (iOS)
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI

struct RefundView: View {
    var body: some View {
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea(.all)
            VStack {
                Color("AccentColor")
                    .ignoresSafeArea(.all)
                ZStack {
                    VStack{
                        Text("Your concert has been found!").font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .padding(.bottom, 25.0)
                        Image("EraTour")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:120.0)
                        Text("Taylor Swift - The Eras Tour").font(.system(size: 25, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading, -10.0)
                            .padding(.bottom, 40.0)
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(Color.white)
                                .frame(width: 300, height: 100)
                            VStack {
                                Text("July 29, 2023").font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundColor(.black)
                                Text("Levi's Stadium, Santa Clara, CA").font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundColor(.black)
                            }
                        }
                        Text("Can't make it? Too far?").font(.system(size: 20, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                        Button(action: {}){
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 100, height: 30)
                                Text("Done").foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .regular, design: .rounded))
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 15.0/*@END_MENU_TOKEN@*/).frame(width: 400, height: 300)
                Color("AccentColor")
                    .ignoresSafeArea(.all)
            }
        }
        
//    func DoneButton() {
//        print("Your order has been fully refunded"})
//
//    }
}
}


struct RefundView_Previews: PreviewProvider {
    static var previews: some View {
        RefundView()
    }
}
