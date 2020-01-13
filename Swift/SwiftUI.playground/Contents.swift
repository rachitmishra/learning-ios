//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct User: Identifiable {
    let id: Int
    init(id: Int) {
        self.id = id
    }
}

func buildView() -> some View {
    let users = (1...100).map {User(id: $0) }
    return VStack(alignment: .center) {
        ScrollView {
            ForEach(users) { user in
                Text("\(user.id)")
            }
        }
    }
}

// Host Swift UI
let hostingController = UIHostingController(rootView: buildView())

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = hostingController
