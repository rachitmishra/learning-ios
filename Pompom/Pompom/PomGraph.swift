//
//  PomGraph.swift
//  Pompom
//
//  Created by Rachit Mishra on 22/12/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import SwiftUI

struct PomItem: View {
    var pomodoro: Pomodoro

    let backgroundGradient =
    AngularGradient(gradient: Gradient(colors: [.red, .yellow]),
                    center: .topLeading)

    var body: some View {
        Capsule()
        .fill(backgroundGradient)
            .frame(width: 24, height: pomodoro.getHeightRatio())
         .padding(.leading, 16.0)
    }
}


struct PomGraph: View {
    var pomodoros: [Pomodoro] = [
        Pomodoro(title: "1"),
        Pomodoro(title: "2"),
        Pomodoro(title: "3"),
        Pomodoro(title: "4"),
        Pomodoro(title: "5"),
        Pomodoro(title: "6")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Today")
                .font(.custom("Questrial", size: 32.0))
                .padding(.leading, 16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.pomodoros) { pomodoro in
                        withAnimation {
                            PomItem(pomodoro: pomodoro)
                        }
                    }
                }
            }
        }
    }
}

struct PomGraph_Previews: PreviewProvider {
    static var previews: some View {
        PomGraph()
    }
}
