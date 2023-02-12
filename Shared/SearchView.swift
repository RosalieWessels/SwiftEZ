//
//  SearchView.swift
//  SwiftEZ (iOS)
//
//  Created by Rosalie Wessels on 2/11/23.
//

//import SwiftUI
//struct SearchView: View {
//    @State var artistsearch: String = ""
//    @State var selection: String = ""
//    var options = ["Taylor Swift", "The Weeknd", "Harry Styles"]
//    var body: some View {
//        NavigationView {
//            ZStack{
//
//
//                Rectangle()
//                    .fill(Color("backgroundColor"))
//                    .frame(width: 390, height: 844)
//                    .ignoresSafeArea(.all)
//                VStack{
//
//                    NavigationLink(destination: ContentView(viewModel: ContentViewModel())) {
//                        Text("Update location").foregroundColor(Color.black)
//                            .font(.system(size: 20, weight: .regular, design: .rounded))
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(20)
//                    }
//
//                    HStack{
//                        Spacer()
//
//                        TextField("Enter your favorite artist here", text: $artistsearch)
//                            .padding([.trailing, .leading], 20)
//                            .padding([.top, .bottom], 10)
//                            .background(Color(UIColor.white))
//                            .cornerRadius(13)
//                            .padding([.trailing, .leading], 40)
//                            .font(Font.system(size: 20, weight: .regular, design: .rounded))
//
//                        Spacer()
//
//                    }
//
//                    Image("TSwift")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .padding([.trailing, .leading], 40)
//                        .padding(15)
//
//
//                }
//
//
//
//
//
//
//            }
//        }
//    }
//
//}

import SwiftUI
struct SearchView: View {
    @State var artistsearch: String = ""
    @State var selection: String = ""
    @State var btoggle: Bool = false
    func signIn(){
        btoggle = true
    }
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .fill(Color("backgroundColor"))
                    .frame(width: 390, height: 844)
                    .ignoresSafeArea(.all)
                
                VStack{
                    
                    NavigationLink(destination: ContentView(viewModel: ContentViewModel())) {
                        Text("Update location").foregroundColor(Color.black)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                    
                    HStack{
                                
                        TextField("Enter your favorite artist here", text: $artistsearch)
                            .padding([.trailing, .leading], 20)
                            .padding([.top, .bottom], 10)
                            .background(Color(UIColor.white))
                            .cornerRadius(13)
                            .font(Font.system(size: 20, weight: .regular, design: .rounded))
                            .padding(.leading, 13)
                        
                        Button(action: signIn) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .font(.title)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 45, height: 45)
                                .padding(8)
                        }
                        Spacer()
                    
                    }
                    .background(Color("backgroundColor"))
                    
                    if btoggle == true{
                        Text(artistsearch)
                            .padding()
                            .font(Font.system(size: 50, weight: .regular, design: .rounded))
                                        
                        VStack{
                            Image("Taylor")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 350)
                                .cornerRadius(20)
                            
                            Button(action: signIn) {
                                Text("Interest Buy")
                                    .font(Font.system(size: 30, weight: .regular, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .padding(20)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                
                            }
                            
                        }
                        
                                        
                    }
                    
                }
            }
        }
    }
        
}
