import SwiftUI

struct GetTabItemDescription: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            Image(systemName: viewModel.imageDescription)
            Text(viewModel.textDescription)
        }
    }
}

struct GetTabItemDemo: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            Image(systemName: viewModel.imageDemo)
            Text(viewModel.textDemo)
        }
    }
}
