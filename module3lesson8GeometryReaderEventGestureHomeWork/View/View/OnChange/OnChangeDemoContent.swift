import SwiftUI

struct OnChangeDemoContent: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView {
            VStack{
                Text("OnChange Demo")
                    .foregroundStyle(.red)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                
                Slider(
                    value: Binding(
                        get: { viewModel.blurAmount },
                        set: { viewModel.blurAmount = $0 }
                    ),
                    in: 0...10
                )
                .onChange(of: viewModel.blurAmount){ oldValue, newValue in
                    print("This is value is \(newValue)")
                }
                
                Text("onChange в действии")
                    .foregroundStyle(.green)
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18 + viewModel.blurAmount * 2))
                    .blur(radius: viewModel.blurAmount * 0.3)
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}
