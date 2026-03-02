import Foundation

@Observable class CoreDataAppViewModel: CoreDataAppProtocol {
    let id: String = UUID().uuidString
    var isEditingCoreTable: Bool = false
    var isAppeared: Bool = false
    var appearCount: Int = 0
    
    var coreTable: [CoreTable] = []
    var tableCustomCell: [TableCustomCell] = []
    var descriptionOnAppear: [DescriptionOnAppear] = []
    
    private let dataCoreTable = DataManager()
    var typeGesture: [GestureType]
    
    init(typeGesture: [GestureType]) {
        self.typeGesture = typeGesture
        loadCoreTable()
        loadTableCustomCells()
        loadOnAppearData()
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
    
    func loadOnAppearData() {
        let descriptionOnAppear = dataCoreTable.getOnAppearData()
        self.descriptionOnAppear = descriptionOnAppear
    }
    
    func incrementAppearCount() {
          guard let increment = descriptionOnAppear.first?.itemCountOnAppear else { return }
          appearCount += increment
      }
      
      func resetAppearState() {
          isAppeared = false
          appearCount = 0
      }
}
