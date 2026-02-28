import SwiftUI

@main
struct module3lesson8GeometryReaderEventGestureHomeWorkApp: App {
    @State private var viewModel = CoreDataAppViewModel(typeGesture: GestureType.allCases)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(viewModel)
            }
        }
    }
}
