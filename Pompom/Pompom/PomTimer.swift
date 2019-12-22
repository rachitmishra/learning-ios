//
//  PomTimer.swift
//  Pompom
//
//  Created by Rachit Mishra on 22/12/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import SwiftUI

struct PomTimer: View {

    var body: some View {
        HStack() {
            Text("25:00")
                .font(.custom("Questrial", size: 72.0))
                .fontWeight(.bold)
            VStack {
                Image(systemName: "bell")
                .foregroundColor(Color.red)
                    .frame(width: 32.0, height: 32.0, alignment: .center)
                Image(systemName: "speaker")
                .foregroundColor(Color.red)
                    .frame(width: 32.0, height: 32.0, alignment: .center)
            }
        }
    }
}


struct PomTimer_Previews: PreviewProvider {
    static var previews: some View {
        PomTimer()
    }
}
