// 'CategoryRow.swift'
// This code handles the different leagues: in this case the Premier League, Championship, League One and League Two. 'International' is also used as a league, because of Wembley. So far this is limited to EFL, PL and Wembley only.
// Part of the Home view: appears as 'EFL League One' and then stadium images beneath (square) in a scrolling view.

import SwiftUI

struct CategoryRow: View {
    // handles the category's name, and the stadiums associated
    var categoryName: String
    var items: [Stadium]
    
    var body: some View {
        // Contained in vertical stack
        VStack(alignment: .leading) {
            // text displays the category name as a title for that section
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            // this view allows the user to scroll through the stadiums for each league, retrieving stadium objects.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { stadium in
                        NavigationLink(
                            destination: StadiumDetail(
                                stadium: stadium
                            )
                        ) {
                            CategoryItem(stadium: stadium)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}
// struct to deal with each Category Item: takes the stadium object, and then produces the square image with the name beneath as caption.
//All images are the same size and appear in scrolling row with the others from their league.
struct CategoryItem: View {
    //first needs stadium object to get name, relevant image
    var stadium: Stadium
    // then we define the view.
    var body: some View {
        // contain it in a vertical stack again
        VStack(alignment: .leading) {
            // retrieve stadium's image, make it resizable and square.
            stadium.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            // retrieve stadium name and set as caption.
            Text(stadium.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: stadiumData[0].category.rawValue,
            items: Array(stadiumData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
