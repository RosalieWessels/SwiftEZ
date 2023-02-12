//
//  ContentView.swift
//  Shared
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
import MapKit
import Firebase
import FirebaseFirestore
import CoreLocation

struct ContentView: View {
    var db = Firestore.firestore()
    @StateObject var viewModel: ContentViewModel
    @FocusState private var isFocusedTextField: Bool
    @State var finalAddress : AddressResult = AddressResult(title: "", subtitle: "")
    @State var selectedAddress = "No address selected"
    var body: some View {
        ZStack {

            Color("backgroundColor")
                .ignoresSafeArea(.all)

            VStack {

                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 0.0)

                Spacer()
                
                Text(selectedAddress)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .foregroundColor(Color.white)
                
                Spacer()

                TextField("Type address", text: $viewModel.searchableText)
                    .padding()
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .foregroundColor(Color.gray)
                    .disableAutocorrection(true)
                    .focused($isFocusedTextField)
                    .onReceive(
                        viewModel.$searchableText.debounce(
                            for: .seconds(1),
                            scheduler: DispatchQueue.main
                        )
                    ) {
                        viewModel.searchAddress($0)
                    }
                    .background(Color.init(uiColor: .systemBackground))
                    .cornerRadius(20)
                    
                    .overlay {
                        ClearButton(text: $viewModel.searchableText)
                            .padding(.trailing)
                            .padding(.top, 8)
                    }
                    .onAppear {
                        isFocusedTextField = true
                    }
                    .padding(.horizontal)

                List(self.viewModel.results) { address in
                    VStack(alignment: .leading) {
                        Text(address.title)
                        Text(address.subtitle)
                    }
                        .listRowBackground(Color.white)
                        .onTapGesture {
                            finalAddress = address
                            print("GOT FINAL ADDRESS", finalAddress)
                            selectedAddress = finalAddress.title
                        }
                }
                .listStyle(.plain)
                .padding(.horizontal)

                Button(action: {DoneButton()}){
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
        // Add a new document in collection "cities"
        let userEmail = Auth.auth().currentUser?.email
        print("user email", userEmail)
        
        let fullAddress = finalAddress.title + " " + finalAddress.subtitle

        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(finalAddress.title) { placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("Lat: \(lat), Lon: \(lon)")
            
            db.collection("users").document(userEmail!).setData([
                "lat": lat!,
                "lon" : lon!,
                "address" : fullAddress
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }

        }
        
    }

}

struct AddressResult: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class ContentViewModel: NSObject, ObservableObject {
    
    @Published private(set) var results: Array<AddressResult> = []
    @Published var searchableText = ""

    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.delegate = self
        return completer
    }()
    
    func searchAddress(_ searchableText: String) {
        guard searchableText.isEmpty == false else { return }
        localSearchCompleter.queryFragment = searchableText
    }
}

extension ContentViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task { @MainActor in
            results = completer.results.map {
                AddressResult(title: $0.title, subtitle: $0.subtitle)
            }
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error)
    }
}

class MapViewModel: ObservableObject {

    @Published var region = MKCoordinateRegion()
    @Published private(set) var annotationItems: [AnnotationItem] = []
    
    func getPlace(from address: AddressResult) {
        let request = MKLocalSearch.Request()
        let title = address.title
        let subTitle = address.subtitle
        
        request.naturalLanguageQuery = subTitle.contains(title)
        ? subTitle : title + ", " + subTitle
        
        Task {
            let response = try await MKLocalSearch(request: request).start()
            await MainActor.run {
                self.annotationItems = response.mapItems.map {
                    AnnotationItem(
                        latitude: $0.placemark.coordinate.latitude,
                        longitude: $0.placemark.coordinate.longitude
                    )
                }
                
                self.region = response.boundingRegion
            }
        }
    }
}

struct ClearButton: View {
    
    @Binding var text: String
    
    var body: some View {
        if text.isEmpty == false {
            HStack {
                Spacer()
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                }
                .foregroundColor(.secondary)
            }
        } else {
            EmptyView()
        }
    }
}

struct AddressRow: View {
    
    let address: AddressResult
    
    var body: some View {
        //Text(address.title, address.subtitle)
        Button(action: {}){
            VStack(alignment: .leading) {
                Text(address.title)
                Text(address.subtitle)
                    .font(.caption)
            }
        }
//        NavigationLink {
//            //MapView(address: address)
//        } label: {
//
//        }
//        .padding(.bottom, 2)
    }
}
