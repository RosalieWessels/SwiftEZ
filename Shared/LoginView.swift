//
//  LoginView.swift
//  SwiftEZ
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
import Firebase
import Combine

struct LoginView: View {
    
    @ObservedObject var model : ModelData
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Taylor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text("SwiftEZ")
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: LogInScreen(model: model, loginPerson: "Audience")) {
                            Text("Audience")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 10, x: 1, y: 1)
                        }
                        
                        NavigationLink(destination: LogInScreen(model: model, loginPerson: "Artist")) {
                            Text("Artist")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 10, x: 1, y: 1)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//  LoginView()
//    }
//}
