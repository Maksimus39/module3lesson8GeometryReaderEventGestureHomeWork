protocol CoreDataAppProtocol {
    var id: String { get }
    var typeGesture: [GestureType] { get set }
    var coreTable: [CoreTable] { get set}
    var isEditingCoreTable: Bool { get set }
    var tableCustomCell: [TableCustomCell] { get set }
    var descriptionOnAppear: [DescriptionOnAppear] { get set }
    var descriptionOnDisappear: [DescriptionOnDisappear] { get set }
}
