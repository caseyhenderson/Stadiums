//
//  StadiumList.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//

import SwiftUI
// LEARNING COMMENTS:
// self = exactly equivalent to the instance it's a property of
// use it to refer to the current instance within its own instance methods
//usually when a parameter name for an instance method has the same name as a property of that instance
// because parameter name takes preference so we have to refer to the property in a more qualified way to differentiate
// that's what self is for
// kind of like this. property in other languages

struct StadiumList: View {
    // this handles the userData, i.e. what we get from the models and what the user selects as favourites (constantly changing). EnvironmentObject used because the object should be an observable object, needed multiple times.
    @EnvironmentObject var userData: UserData
    @State private var viewIndex = 0

    var stadiums = [Stadium]()
    var body: some View {
             // copy from l
        // check view, remove MV
        VStack {
            Picker(selection: $viewIndex, label:
                Text("")) {
                Text("Stadiums").tag(0)
                Text("Favourites").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            
            // either change the view to a slimmed-down SD or stay with it: memory issue.
            if viewIndex == 0 {
                List(userData.stadiums, id: \.id) {
                    stadium in SlimStadium(stadium: stadium)
                }
            }else if viewIndex == 1 {
                    List(Helper.getFavourites(), id: \.id) { stadium in
                    SlimStadium(stadium: stadium)
                }
            }
            
            }
            
        }
    }





// This preview shows us how it looks on different size iPhones.
struct StadiumList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone SE"], id: \.self) { deviceName in StadiumList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
    }
    .environmentObject(UserData())
}
}
// LEARNING COMMENTS PART TWO:
// environmentObject(_:) modifier: used so views further down in the view hierarchy can read data objects that have been passed down
// binding: controls storage for a value so we can pass data around to different views that need to read/write it.
//    var body: some View {
//
//
//
//        List {
//                // allows the user to only see their visited/favorite stadiums.
//                Toggle(isOn: $userData.showFavoritesOnly) {
//                Text("Visited only")
//                }
//
//                ForEach(userData.stadiums) { stadium in //  a really weird for loop initialising the list
//                if !self.userData.showFavoritesOnly || stadium.favourite {
//                    NavigationLink(destination: StadiumDetail(stadium: stadium).environmentObject(self.userData)) { // this links it to the clicky part on nav menus - good stuff
//                        StadiumRow(stadium: stadium) // using collections of Stadiums directly now we don't need the id parameter (because we are identifiable as declared in stadium.swift)
//                }
//            }
//
//        }
//        .navigationBarTitle(Text("Stadiums of England"))
//
//
//        }
//    }
//}
// List(stadiums, id: \.id) { stadium in
       //            StadiumRow(stadium: stadium).environmentObject(self.userData)
