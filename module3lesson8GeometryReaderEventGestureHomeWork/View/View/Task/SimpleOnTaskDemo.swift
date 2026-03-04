import SwiftUI

struct SimpleOnTaskDemo: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack (spacing: 10){
                VStack(alignment: .center, spacing: 5){
                    Text("Я сделал свой первый запрос в интернет, еху))")
                    Text("YouTube - сила")
                }
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 16))
                
                if let image = viewModel.imageTask{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
            .padding()
            .onAppear{
                Task {
                    await viewModel.fetchImageData(url: viewModel.url)
                }
            }
        }
    }
}
