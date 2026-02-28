import Foundation

enum GestureType: String, CaseIterable {
    case onAppear
    case GeometryProxy
    case onDisappear
    case task
    case onChange
    case TapGesture
    case LongPressGesture
    case DragGesture
    case ANIMATION
}

struct CoreTable: Identifiable {
    let id: String = UUID().uuidString
    let footer: String
    let image: String
    let title: String
}

struct TableCustomCell: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let image: String
    let description: String
}


struct GestureDemo {
    let id: String = UUID().uuidString
    let typeGesture: GestureType
    let coreTable: [CoreTable]
    let isEditing: Bool = false
    let tableCustomCell: [TableCustomCell]
}



