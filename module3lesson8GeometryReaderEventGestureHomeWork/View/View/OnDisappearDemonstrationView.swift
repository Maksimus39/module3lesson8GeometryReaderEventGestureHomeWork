import SwiftUI


struct OnDisappearDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let text = viewModel.tableCustomCell
            .first(where: { $0.type == .onDisappear })?.description
        ?? "Описание для onDisappear отсутствует"
        
        VStack{
            ScrollView(.vertical) {
                Text(text)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}
