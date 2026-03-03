import SwiftUI

struct OnAppearDemoContent: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        VStack(spacing: 30) {
            RoundedRectangle(cornerRadius: 20)
                .fill(viewModel.isAppeared ? .green : .blue)
                .frame(height: 50)
                .overlay {
                    Text(viewModel.isAppeared ? "Появился ✅" : "Ожидает появления...")
                        .foregroundColor(.white)
                        .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                }
                .onAppear {
                    viewModel.isAppeared = true
                    viewModel.incrementAppearCount() 
                }
                .onDisappear {
                    viewModel.isAppeared = false
                }
            
            Text("Количество появлений: \(viewModel.appearCount)")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                .foregroundColor(.primary)
            
            Text("""
                Как это работает:
                При первом открытии экрана — срабатывает onAppear
                При свайпе влево/вправо и возврате — срабатывает снова
                """)
            .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            Button("Сбросить счётчик") {
                viewModel.resetAppearState()
            }
            .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
            .buttonStyle(.bordered)
            .padding(.top, 10)
        }
        .padding()
    }
}
