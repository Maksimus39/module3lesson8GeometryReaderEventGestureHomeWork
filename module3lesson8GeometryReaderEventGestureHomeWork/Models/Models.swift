import Foundation

enum GestureType: String, CaseIterable {
    case onAppear
    case onDisappear
    case task
    case onChange
    case TapGesture
    case LongPressGesture
    case DragGesture
    case GeometryProxy
    case Animation
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
    let type: GestureType
}

struct DescriptionOnAppear: Identifiable {
    let id: String = UUID().uuidString
    let tabItemOnAppear: String
    let textOnAppear: String
    let isAppeared: Bool
    let appearCount: Int
    let itemCountOnAppear: Int
}

struct DescriptionOnDisappear: Identifiable {
    let id: String = UUID().uuidString
    let descriptionDisappear: String
    let demoDisappear: String
}

struct TaskDemonstration: Identifiable {
    let id: String = UUID().uuidString
    let descriptionTask: String
    let demoTask: String
}

struct GestureDemo {
    let id: String = UUID().uuidString
    let typeGesture: GestureType
    let coreTable: [CoreTable]
    let isEditing: Bool = false
    let tableCustomCell: [TableCustomCell]
    let descriptionOnAppear: [DescriptionOnAppear]
    let descriptionOnDisappear: [DescriptionOnDisappear]
    let taskDemonstration: [TaskDemonstration]
}



