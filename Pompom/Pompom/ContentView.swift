import SwiftUI

struct PomodoroLogo: View {

    var body: some View {
        HStack {
            Image(systemName: "clock")
                .frame(width: 32.0, height: 32.0, alignment: .center)
                .foregroundColor(Color.red)
            Text("pompom")
                .font(.custom("Questrial", size: 30.0))
        }
    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            PomodoroLogo()
            Spacer()
            PomTimer()
            //CenterView()
            Spacer()
            PomGraph()
            PomTotal()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
