import SwiftUI

struct TapGestureDemonstration: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 40){
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 200)
                        .foregroundStyle(viewModel.isSelected ? Color.green.opacity(0.9)
                                         : Color.red .opacity(0.9))
                    
                    Text("Наблюдаем за изменением isSelected")
                        .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                }
                
                Button {
                    viewModel.isSelected.toggle()
                } label: {
                    Text("Button")
                        .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(25)
                }
                
                Text("TAP Gesture")
                    .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .cornerRadius(25)
                    .onTapGesture {
                        viewModel.isSelected.toggle()
                    }
                
                Spacer()
            }
        }
        .padding()
    }
}
