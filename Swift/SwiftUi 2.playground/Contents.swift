//import UIKit
import PlaygroundSupport
import SwiftUI


//struct RedCircle: View {
//    var body: some View {
//        Circle().fill(Color.red)
//    }
//}
//
//struct GradientView: View {
//    var body: some View {
//        let spectrum = Gradient(colors: [.red, .green, .blue])
//    }
//}
//
//struct WedgeShape: Shape {
//    var wedge: Ring.Wedge
//
//    func path(in rec: CGRect) -> Path {
//        var p = Path()
//        let g = WedgeGeometry(wedge, in: rect)
//        return p
//    }
//
//    var animatableData: Ring.Wedge.AnimatableData {
//
//    }
//}

func buildView() -> some View {
    return VStack(alignment: .center) {
        Text("Swift UI!").font(.title)
        Text("Hello!")
            .padding(.all, 4)
            .background(Color.green)
            .cornerRadius(4)
    }
}

// Host Swift UI
let hostingController = UIHostingController(rootView: buildView())

//struct OrderHistory: View {
//    let previousOrder: [CompletedOrder]
//
//    var body: some View {
//        List(previousOrder) { order in
//
//        }
//    }
//}
//PlaygroundPage.current.liveView = hostingController

// @IBSegue
// @Binding
// Representable Protocol
// Coordinator, createView, update view
// ViewController Representable Protocol
// Make ViewController, Update ViewController

// Integrating with data
// @ObjectBinding
// Reversebinding with $
// BindableObject

// ---------------------------
// ViewModifier
