import SwiftUI

struct GestureDetailView: View {
    let type: GestureType
    
    var body: some View {
        switch type {
        case .onAppear:
            OnAppearDemonstrationView()
        case .onDisappear:
            OnDisappearDemonstrationView()
        case .task:
            TaskDemonstrationView()
        case .onChange:
            OnChangeDemonstrationView()
        case .TapGesture:
            TapGestureDemonstrationView()
        case .LongPressGesture:
            LongPressGestureDemonstrationView()
        case .DragGesture:
            DragGestureDemonstrationView()
        case .GeometryProxy:
            GeometryProxyDemonstrationView()
        case .Animation:
            AnimationDemonstrationView()
        }
    }
}
