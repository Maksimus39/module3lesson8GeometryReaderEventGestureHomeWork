import SwiftUI

struct TaskDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let text = viewModel.tableCustomCell
            .first(where: { $0.type == .task })?.description
        ?? "Описание для task отсутствует"
        
        let title = viewModel.tableCustomCell
            .first(where: { $0.type == .task })?.title
        ?? "task"
        
        TabView {
            ScrollView(.vertical) {
                Text(text)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
                    .padding()
            }
            .tabItem {
                Image(systemName: "pencil.and.list.clipboard")
                Text("Описание")
            }
            SimpleOnTaskDemo()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Демо")
                }
        }
        .navigationTitle(title)
    }
}



