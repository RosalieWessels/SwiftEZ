//
//  ArtistView.swift
//  SwiftEZ
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
import MapKit
import Firebase


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
    var db = Firestore.firestore()
    let mapView = MKMapView()
    
    @State var locationMarkersFinished = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3852, longitude: -122.1141), span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
    
    @State var annotations = [
        Location(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.5072, longitude: 0.1276))
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
                            .foregroundColor(.white)
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
                                .foregroundColor(.white)
                        Text("1,353,583").font(.system(size: 30, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                }
                if locationMarkersFinished == true {
                    Map(coordinateRegion: $region, annotationItems: annotations) {
                        MapAnnotation(coordinate: $0.coordinate) {
                            Circle()
                                //.strokeBorder(.black, lineWidth: 4)
                                .fill(Color.black.opacity(0.25))
                                .frame(width: 120, height: 120)
                        }
                        
                    }.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 15.0/*@END_MENU_TOKEN@*/).frame(width: 400, height: 300)
                }
                
                Color("AccentColor")
                    .ignoresSafeArea(.all)
            }
            .padding(.all, -100.0)
        }
        .onAppear(perform: getLocations)
    }
    
    func getLocations() {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let email = document.get("email") as! String
                    if email != "taylorswift@gmail.com" {
                        let lat = document.get("lat") as! Double
                        let lon = document.get("lon") as! Double
                        var an = Location(name: "EmailInterest", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                        annotations.append(
                            an
                        )
                        print("JUST ADDED NEW ANNOTATION")
                    }
                    //region.addAnnotation(an)
                }
            }
        }
        print("PUTTING ON MAP VIEW")
        locationMarkersFinished = true
        
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
