import SwiftUI

struct AnimationView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundStyle(.gray.opacity(0.4))
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundStyle(.blue)
                    .frame(width: viewModel.markerWidth)
                    .offset(x: viewModel.onLeftSide
                            ? viewModel.markerOfSet
                            : -viewModel.markerOfSet)
            }
            .frame(width: viewModel.barWidth, height: viewModel.barHeight)
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
            .animation(.easeInOut(duration: 1.2)
                .delay(0.2)
                .repeatForever(autoreverses: true)
                       , value: viewModel.onLeftSide)
            .onTapGesture {
                viewModel.onLeftSide.toggle()
            }
            .onAppear{
                viewModel.onLeftSide = true
            }
        }
    }
}
