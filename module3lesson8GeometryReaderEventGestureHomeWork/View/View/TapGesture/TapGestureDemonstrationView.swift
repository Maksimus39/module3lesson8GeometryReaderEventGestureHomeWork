import SwiftUI

struct TapGestureDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let text = viewModel.tableCustomCell
            .first(where: { $0.type == .TapGesture })?.description
        ?? "Описание для task отсутствует"
        
        let title = viewModel.tableCustomCell
            .first(where: { $0.type == .TapGesture })?.title
        ?? "TapGesture"
        
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
            TapGestureDemonstration()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Демо")
                }
        }
        .navigationTitle(title)
    }
}



