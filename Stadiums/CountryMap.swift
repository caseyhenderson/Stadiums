//
//  CountryMap.swift
//  Stadiums
//
//  Created by Casey Henderson on 19/06/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//
// The one that does the actual work populating the map
import SwiftUI
import MapKit


struct CountryMap: UIViewRepresentable {
    // all the necessary vars.
    var coordinate: CLLocationCoordinate2D // we're no longer hard coding
    @EnvironmentObject var userData: UserData
    var stadium: Stadium
    var stadiumIndex: Int {
        userData.stadiums.firstIndex(where: { $0.id == stadium.id })!
    }
    // setting the visible portion of the map to cover the UK (initial view, no zooming)
    public var latDelta = 15.0
    public var longDelta = 15.0
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
        
    }
    // This populates the view with the map pins/annotations for each and every stadium. It also defines span and region for the map, centering it on the centre point of England.
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center:coordinate, span: span)
        uiView.setRegion(region, animated: true)
        for increment in 0...91 {
            let testLocation = stadiumData[increment].locationCoordinate
            let annotation = MKPointAnnotation()
            annotation.coordinate = testLocation
            annotation.title = stadiumData[increment].name
            annotation.subtitle = stadiumData[increment].club
            uiView.addAnnotation(annotation)
        }
        
    }
    
}

struct CountryMap_Previews: PreviewProvider {
    static var previews: some View {
        CountryMap(coordinate: stadiumData[0].locationCoordinate, stadium: stadiumData[0])
    }
}


