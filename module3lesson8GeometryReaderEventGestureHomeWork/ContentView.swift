import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .getGeistLiterataFont(.geistRegular, size: 30)
            
            Text("Hello, world!")
                .getGeistLiterataFont(.literataRegular, size: 30)
            
            Text("Hello, world!")
                .getGeistLiterataFont(.literataItalicExtraLightItalic, size: 30)
        }
        .padding()
        }
    }





#Preview {
    ContentView()
}
