//
//  MapView17.swift
//  SwiftPlayground
//
//  Created by francis on 09/04/2025.
//

import SwiftUI
import MapKit


struct MapView17 : View {
 
    let cameraPosition : MapCameraPosition =
//        .region(.init(center: .init(latitude: 6.499813, longitude:3.360847), latitudinalMeters: 1300, longitudinalMeters: 1300))
        .region(.init(center: .init(latitude: 51.554867, longitude: -0.109112), latitudinalMeters: 1300, longitudinalMeters: 1300))
    
    let locationManager = CLLocationManager()
    //        .region(.init(center: .init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1300, longitudinalMeters: 1300))
    
    var body: some View {
        Map(initialPosition: cameraPosition){
            Marker("World's Best Team", systemImage: "soccerball",coordinate: .EmiratesHQ)
                .tint(.black)
            Marker("Around", systemImage: "globe",coordinate: .EmiratesHQ2)
            
            UserAnnotation()
        }
        .onAppear{
            locationManager.requestWhenInUseAuthorization()
          
        }
        .mapControls{
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .mapStyle(.hybrid(elevation: .realistic))
    }
}


#Preview {
    MapView17()
}


extension CLLocationCoordinate2D {
    static let EmiratesHQ = CLLocationCoordinate2D(latitude: 51.554867, longitude:  -0.109112)
    static let EmiratesHQ2 = CLLocationCoordinate2D(latitude: 51.564767, longitude:  -0.109212)
}


