/* Home.swift, CH 2020*/

import SwiftUI
import CoreLocation
import MapKit
//standard imports
// stadiums by category.
struct CategoryHome: View {

    // sorts the stadiums into their categories
    var categories: [String: [Stadium]] {
        Dictionary(
            grouping: stadiumData,
            by: { $0.category.rawValue }
        )
    }
    // featured
    var featured: [Stadium] {
        stadiumData.filter { $0.isFeatured }
    }

    
    // the central coordinates for England, to centre the map.
    var centralCoordinates: CLLocationCoordinate2D {
         CLLocationCoordinate2D(
            latitude: 52.568827,
            longitude: -1.485026)
     }

    var mapButton: some View {
        // This var exists to handle the view for the map button, launching the Country View that displays the national map.
        NavigationLink(destination: Country(stadium: stadiumData[0])) {
            // system icons, thanks SF Symbols
            Image(systemName: "map")
                .imageScale(.large)
                .accessibility(label: Text("Map Button"))
                .padding()
        }
    }
    //regulating the span, view of the map
    let longDelta = 1.0
    let latDelta = 1.0
    // nav view for the main UI of the home view.
    var body: some View {
        NavigationView {
            List {
                // Featured Stadiums.
                FeaturedStadiums(stadiums: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                // sorts categories
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                // gateway to the full list
                NavigationLink(destination: StadiumList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Stadiums of England"))
            .navigationBarItems(trailing: mapButton)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // if we want split view in the future, come back and remove this line
        

        
    }
    
}
// featured struct: contains our featured ones.
struct FeaturedStadiums: View {
    var stadiums: [Stadium]
    var body: some View {
        stadiums[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
