protocol CoreDataAppProtocol {
    var id: String { get }
    var typeGesture: [GestureType] { get set }
    var coreTable: [CoreTable] { get set}
    var isEditing: Bool { get set }
    var tableCustomCell: [TableCustomCell] { get set }
}
