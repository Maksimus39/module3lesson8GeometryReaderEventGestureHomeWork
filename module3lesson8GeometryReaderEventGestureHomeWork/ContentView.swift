import SwiftUI
import UIKit

struct ContentView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    @State private var selectedGestureType: GestureType?
    
    private var isEditingBinding: Binding<Bool> {
        Binding(
            get: { viewModel.isEditingCoreTable },
            set: { viewModel.isEditingCoreTable = $0 }
        )
    }
    
    var body: some View {
        NavigationStack{
            CoreTableUIKitRepresentableView(isEditing: isEditingBinding)
                .navigationDestination(isPresented: isEditingBinding){
                    TableCustomCellRepresentableView(selectedGestureType: $selectedGestureType )
                        .environment(viewModel)
                        .navigationTitle(viewModel.coreTable.first?.title ?? "No data")
                        .navigationDestination(item: $selectedGestureType) { gestureType in
                            GestureDetailView(type: gestureType)
                                .environment(viewModel)
                        }
                }
                
        }
    }
}
