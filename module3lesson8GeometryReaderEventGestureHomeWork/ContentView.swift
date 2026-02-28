import SwiftUI
import UIKit

struct ContentView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    private var isEditingBinding: Binding<Bool> {
        Binding(
            get: { viewModel.isEditing },
            set: { viewModel.isEditing = $0 }
        )
    }
    
    var body: some View {
        NavigationStack{
            CoreTableUIKitRepresentableView(isEditing: isEditingBinding)
                .navigationDestination(isPresented: isEditingBinding){
                    TableCustomCellRepresentableView()
                        .environment(viewModel)
                        .navigationTitle("Какой-то заголовок))")
                }
        }
    }
}





