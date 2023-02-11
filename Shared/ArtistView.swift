//
//  ArtistView.swift
//  SwiftEZ
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

struct ArtistView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    let annotations = [
        Location(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        Location(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        Location(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        Location(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
    ]
    
    var body: some View {
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea(.all)
            VStack {
                Color("AccentColor")
                    .ignoresSafeArea(.all)
                ZStack {
                    VStack{
                        Text("Artist Analytics").font(.system(size: 40, weight: .bold, design: .rounded))
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
                            Text("Total Interested:").font(.system(size: 30, weight: .semibold, design: .rounded))
                                .foregroundColor(.purple)
                        Text("1,353,583").font(.system(size: 30, weight: .regular, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    
                }
                Map(coordinateRegion: $region, annotationItems: annotations) {
                    MapAnnotation(coordinate: $0.coordinate) {
                        Circle()
                            .strokeBorder(.red, lineWidth: 4)
                            .frame(width: 40, height: 40)
                    }
                    
                }.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 15.0/*@END_MENU_TOKEN@*/).frame(width: 400, height: 300)
                Color("AccentColor")
                    .ignoresSafeArea(.all)
            }
            .padding(.all, -100.0)
        }
    }
    
//    struct ArtistView_Previews: PreviewProvider {
//        static var previews: some View {
//            ArtistView()
//
//        }
//    }
}

struct Previews_ArtistView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
