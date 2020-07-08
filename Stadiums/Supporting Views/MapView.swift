//
//  MapView.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import SwiftUI
import MapKit
// the backbone behind all our mapViews.

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D // we're no longer hard coding
    public var latDelta = 0.005
    public var longDelta = 0.005
    // sets initial visible region.
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    // sets span, region
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center:coordinate, span: span)
        uiView.setRegion(region, animated: true)        
    }
    
}
// needed later for annotation

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Keepmoat Stadium"
        annotation.subtitle = "Home to Doncaster Rovers."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: stadiumData[0].locationCoordinate)
    }
}
//iterate through to add pins
