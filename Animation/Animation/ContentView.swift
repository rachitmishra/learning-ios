//
//  ContentView.swift
//  Animation
//
//  Created by Rachit Mishra on 27/12/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}

struct OrbitEffect: GeometryEffect {
  let initialAngle = CGFloat.random(in: 0 ..< 2 * .pi)

  var percent: CGFloat = 0
  let radius: CGFloat

  var animatableData: CGFloat {
    get { return percent }
    set { percent = newValue }
  }

  func effectValue(size: CGSize) -> ProjectionTransform {
    let angle = 2 * .pi * percent + initialAngle
    let pt = CGPoint(
      x: cos(angle) * radius,
      y: sin(angle) * radius)
    return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
  }
}

struct ContentView: View {
    @State private var offsetB: CGFloat = 0
    @State private var offsetA: CGFloat = 0
    @State private var rotationDegree: Double = 90
    @State private var animationFlag = false
    private var animation = Animation.linear.repeatForever(autoreverses: true)

    func makeOrbitEffect(diameter: CGFloat) -> some GeometryEffect {
      return OrbitEffect(
        percent: self.animationFlag ? 1.0 : 0.0,
        radius: diameter / 2.0)
    }

    var body: some View {
        ZStack {
            VStack {
                Text("A card")
            }.padding()
                .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            ContentView()
            ContentView()
        }
    }
}

/*
 ZStack {
     Circle()
     .fill()
         .foregroundColor(Color.black)
         .frame(width: 100, height: 100, alignment: .center)
         .offset(x: offsetA, y: 0)
     .modifier(self.makeOrbitEffect(diameter: 100 + 5))
     .animation(Animation
       .linear(duration: 5)
       .repeatForever(autoreverses: false)
     )

     Circle()
         .fill()
         .foregroundColor(Color.green)
         .frame(width: 100, height: 100, alignment: .center)
         .offset(x: offsetB, y: 0)
         .modifier(self.makeOrbitEffect(diameter: 100 + 5))
         .animation(Animation
           .linear(duration: 5)
           .repeatForever(autoreverses: false)
         )
     }

 .background(Color.orange)
 .onAppear {
     self.animationFlag.toggle()
 }
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
