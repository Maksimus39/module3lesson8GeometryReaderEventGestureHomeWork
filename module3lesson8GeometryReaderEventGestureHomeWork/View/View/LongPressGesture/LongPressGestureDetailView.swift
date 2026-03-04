import SwiftUI

struct LongPressGestureDetailView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView (.vertical) {
            Text(viewModel.isCompletedLongPressGesture
                 ? "COMPLETED"
                 : "NOT COMPLETED")
            
            .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 18))
            .padding()
            .padding(.horizontal)
            .background(viewModel.isCompletedLongPressGesture
                        ? .gray
                        : .mint
            )
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 4, maximumDistance: 40 ) {
                viewModel.isCompletedLongPressGesture.toggle()
            }
        }
    }
}
