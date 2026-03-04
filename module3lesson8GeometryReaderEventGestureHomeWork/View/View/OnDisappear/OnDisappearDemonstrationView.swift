import SwiftUI

struct OnDisappearDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let descriptionText = viewModel.tableCustomCell
            .first(where: { $0.type == .onDisappear })?.description
        ?? "Описание отсутствует"
        
        let title = viewModel.tableCustomCell
            .first(where: { $0.type == .onDisappear })?.title
        ?? "onDisappear"
        
        TabView {
            ScrollView(.vertical) {
                Text(descriptionText)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
                    .padding()
            }
            .tabItem {
                GetTabItemDescription()
            }
            
            
            SimpleOnDisappearDemo()
                .tabItem {
                    GetTabItemDemo()
                }
        }
        .navigationTitle(title)
    }
}
