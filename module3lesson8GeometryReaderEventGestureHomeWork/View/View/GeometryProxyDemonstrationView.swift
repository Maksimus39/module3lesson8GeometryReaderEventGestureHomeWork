import SwiftUI


struct GeometryProxyDemonstrationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        let text = viewModel.tableCustomCell
            .first(where: { $0.type == .GeometryProxy })?.description
        ?? "Описание для GeometryProxy отсутствует"
        
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
