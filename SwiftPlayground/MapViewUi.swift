//
//  MapViewUi.swift
//  SwiftPlayground
//
//  Created by francis on 01/04/2025.
//

import SwiftUI
import MapKit


struct MapViewUi : View {
    
    @State private var currentLocation : CLLocationCoordinate2D? = nil
    let startCoord = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    let endCoord = CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094)
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//    let region = MKCoordinateRegion(center: startCoord, span: span)

    @State private var route:MKRoute? =  nil
    var body: some View {
        Map(
            
        ){
            
            
            if let location = currentLocation {
                Annotation(coordinate: location, content:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40,height: 40)
                        Image(systemName: "car")
                            .foregroundColor(.white)
                    }
                },
                           label: {
                    Text("Luxury")
                }
                )
            }
            
            
            if let route = route {
                MapPolyline(route.polyline)
                    .stroke(.black,lineWidth: 5)
                
                
            }
        }
        
        .onAppear{
            currentLocation = startCoord
            findRoute()
        }
    }
    
    
    
    
    
    private func findRoute (){
        let request = MKDirections.Request()
        
        
        request.source = MKMapItem(
            placemark: MKPlacemark(coordinate: startCoord)
        )
        request.destination = MKMapItem(
            placemark: MKPlacemark(coordinate: startCoord)
        )
        
        request.transportType = .automobile
        
        let direction = MKDirections(request: request)
        
        direction.calculate{ response,error in
            if let error =  error {
                print(error.localizedDescription)
                return
            }
            
            if let route = response?.routes.first {
                self.route = route
            }
            
        }
    }
}


#Preview {
    MapViewUi()
}
