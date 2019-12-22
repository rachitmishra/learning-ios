//
//  PomTotal.swift
//  Pompom
//
//  Created by Rachit Mishra on 22/12/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import SwiftUI

struct PomCategoryItem: View {

    var category: PomodoroCategory

    let backgroundGradient =
    AngularGradient(gradient: Gradient(colors: [.red, .orange]),
                    center: .topLeading)

    var body: some View {
        VStack {
            Text(category.title)
                .foregroundColor(Color.white)
                .font(.custom("Questrial", size: 24.0))
            Text("\(category.count)")
                .foregroundColor(Color.white)
                .font(.largeTitle)
        }
            .padding(.all)
            .background(backgroundGradient)
            .cornerRadius(10.0)
            .padding(.leading)
    }
}

struct PomTotal: View {
    var categories: [PomodoroCategory] = [
        PomodoroCategory(title: "Algorithms"),
    PomodoroCategory(title: "Games"),
    PomodoroCategory(title: "Android"),
    PomodoroCategory(title: "iOS")]

    var body: some View {
        VStack(alignment: .leading) {
            Text("All")
                .font(.custom("Questrial", size: 32.0))
                .padding(.top, 16.0)
                .padding(.leading, 16.0)
                .padding(.bottom, 8.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.categories) { category in
                        PomCategoryItem(category: category)
                    }
                }
            }
        }
    }
}

struct PomTotal_Previews: PreviewProvider {
    static var previews: some View {
        PomTotal()
    }
}
