//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 徐其东 on 2019/11/22.
//  Copyright © 2019 xuqidong. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var userData: UserData
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { lankmark in
                        NavigationLink(destination: LandmarkDetail(landmark: lankmark)) {
                            CategoryItem(landmark: lankmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width:155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}


struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4))
        )
    }
}
