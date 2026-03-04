import SwiftUI

struct GeometryProxy: View {
    var body: some View {
        OuterView()
            .background(.red.opacity(0.6))
    }
}

struct OuterView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Top")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
            
            InnerView()
                .background(Color.green.opacity(0.3))
                .frame(height: 200)
            
            Text("Bottom")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
        }
        .padding()
    }
}

struct InnerView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Left")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                .padding()
                .background(Color.yellow.opacity(0.5))
                .cornerRadius(8)
            
            GeometryReader { proxy in
                let containerFrame = proxy.frame(in: .local)
                
                Text("Center")
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(viewModel.isDragging ? .purple : .blue)
                    )
                    .foregroundColor(.white)
                    .shadow(radius: viewModel.isDragging ? 4 : 2)
                    .position(
                        x: max(40, min(containerFrame.width - 40, 40 + viewModel.offset.width)),
                        y: containerFrame.midY + viewModel.offset.height
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                viewModel.isDragging = true
                                viewModel.offset = value.translation
                            }
                            .onEnded { _ in
                                viewModel.isDragging = false
                                withAnimation(.spring()) {
                                    viewModel.offset = .zero
                                }
                            }
                    )
                    .overlay {
                        if !viewModel.isDragging {
                            Circle()
                                .fill(.red.opacity(0.5))
                                .frame(width: 6, height: 6)
                                .position(x: containerFrame.midX, y: containerFrame.midY)
                        }
                    }
                    .onTapGesture {
                    }
            }
            .background(.orange.opacity(0.5))
            .cornerRadius(12)
            .frame(height: 150)
            
            Text("Right")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                .padding()
                .background(.cyan.opacity(0.5))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}
