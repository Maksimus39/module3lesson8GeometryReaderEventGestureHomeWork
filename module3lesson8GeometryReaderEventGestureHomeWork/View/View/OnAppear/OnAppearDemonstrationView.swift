import SwiftUI

struct OnAppearDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let descriptionText = viewModel.tableCustomCell
            .first(where: { $0.type == .onAppear })?.description
        ?? "Описание отсутствует"
        
        let title = viewModel.tableCustomCell
            .first(where: { $0.type == .onAppear })?.title
        ?? "onAppear"
        
        TabView {
            ScrollView(.vertical) {
                Text(descriptionText)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .tabItem {
                GetTabItemDescription()
            }
            
            OnAppearDemoContent()
                .tabItem {
                    GetTabItemDemo()
                }
        }
        .navigationTitle(title)
    }
}
