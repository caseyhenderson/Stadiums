//
//  Stadium.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit
// creates the structure of Stadium and its many, many vars
struct Stadium: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var county: String
    var club: String
    var category: Category
    var isFavorite: Bool
    var favourite = false
    // this can be assigned by user
    var isFeatured: Bool
    // this is default
    var wikiLink: String
    var credit: String
   // a more complicated var, containing lat and long of stadiums
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    // nice big enum for category, containing all the cases. Featured almost treated as its own league here.
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case international = "International"
        case premierleague = "Premier League"
        case championship = "EFL Championship"
        case leagueone = "EFL League One"
        case leaguetwo = "EFL League Two"

    }
}

// helps to handle the appropriate images for stadium.
extension Stadium {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

// needed later, particularly for wikiLink
extension URL {
    init(staticString string:StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
            }
        self = url
    }
        
}
// test for the annotation and pins later.
extension MKPointAnnotation {
    var point: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Stadium"
        annotation.subtitle = "Yeah, this is a stadium. Yay."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 50.0, longitude: 50.5)
        return annotation
    }
}
// big struct for coordinates, defining lat and long as doubles.
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

//list of favs
//then defaults.bool forKey favs
