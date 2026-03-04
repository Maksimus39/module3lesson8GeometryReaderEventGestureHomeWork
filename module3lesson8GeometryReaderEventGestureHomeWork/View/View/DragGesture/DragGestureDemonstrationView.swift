import SwiftUI


struct DragGestureDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let descriptionText = viewModel.tableCustomCell
            .first(where: { $0.type == .DragGesture })?.description
        ?? "Описание отсутствует"
        
        let title = viewModel.tableCustomCell
            .first(where: { $0.type == .DragGesture })?.title
        ?? "DragGesture"
        
        TabView {
            ScrollView(.vertical) {
                Text(descriptionText)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .tabItem {
                Image(systemName: "pencil.and.list.clipboard")
                Text("Описание")
            }
            
            DragGestureDemonstration()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Демо")
                }
        }
        .navigationTitle(title)
    }
}


