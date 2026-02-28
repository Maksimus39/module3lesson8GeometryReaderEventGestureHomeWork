import Foundation

@Observable class CoreDataAppViewModel: CoreDataAppProtocol {
    let id: String = UUID().uuidString
    var isEditing: Bool = false
    
    var coreTable: [CoreTable] = []
    var tableCustomCell: [TableCustomCell] = []
    
    private let dataCoreTable = DataManager()
    
    var typeGesture: [GestureType]
    
    init(typeGesture: [GestureType]) {
        self.typeGesture = typeGesture
        loadCoreTable()
        loadTableCustomCells()
    }
    
    func loadCoreTable() {
        let coretable = dataCoreTable.getCoreTable()
        self.coreTable = [coretable]
    }
    
    func loadTableCustomCells() {
        var allCells: [TableCustomCell] = []
        
        for gesture in typeGesture {
            let cellsForGesture = dataCoreTable.getTableCustomCell(for: gesture)
            allCells.append(contentsOf: cellsForGesture)
        }
        
        self.tableCustomCell = allCells
    }
}
