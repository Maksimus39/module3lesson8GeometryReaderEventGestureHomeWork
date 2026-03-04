import SwiftUI

struct DragGestureDemonstration: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView (.vertical){
            ZStack{
                Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(viewModel.isAnimating ? 1 : 0)
                    .offset(x: viewModel.imageOffSet.width, y: viewModel.imageOffSet.height)
                    .scaleEffect(viewModel.imageScale)
                    .onTapGesture(count: 2, perform: {
                        if viewModel.imageScale == 1 {
                            withAnimation(.spring()) {
                                viewModel.imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()){
                                viewModel.imageScale = 1
                            }
                        }
                    })
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)){
                                    viewModel.imageOffSet = value.translation
                                }
                            }
                            .onEnded({ _ in
                                if viewModel.imageScale <= 1 {
                                    withAnimation(.spring()) {
                                        viewModel.imageScale = 1
                                        viewModel.imageOffSet = .zero
                                    }
                                }
                            })
                    )
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear  {
                withAnimation(.linear(duration: 1)){
                    viewModel.isAnimating = true
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
