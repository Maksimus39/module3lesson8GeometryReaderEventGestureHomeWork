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
        
        let descriptionDisappear = viewModel.descriptionOnDisappear.first?.descriptionDisappear ?? "Описание"
        let demoDisappear = viewModel.descriptionOnDisappear.first?.demoDisappear ?? "Демо"
        
        TabView {
            ScrollView(.vertical) {
                Text(descriptionText)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
                    .padding()
            }
            .tabItem {
                Image(systemName: "pencil.and.list.clipboard")
                Text(descriptionDisappear)
            }
            
            
            SimpleOnDisappearDemo()
                .tabItem {
                    Image(systemName: "eye")
                    Text(demoDisappear)
                }
        }
        .navigationTitle(title)
    }
}
