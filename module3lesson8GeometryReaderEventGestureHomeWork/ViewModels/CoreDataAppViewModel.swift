import Foundation
import UIKit

@Observable class CoreDataAppViewModel: CoreDataAppProtocol {
    let id: String = UUID().uuidString
    var isEditingCoreTable: Bool = false
    
    // Состояние onAppear
    var isAppeared: Bool = false
    var appearCount: Int = 0
    
    // Состояние для onDisappear (таймер)
    var isRunning: Bool = false
    var counterOnDisappear: Int = 0
    var timerOnDisappear: Timer? = nil
    let timerInterval: Double = 1.0
    let initialCounter: Int = 0
    
    // Состояние task
    var imageTask: UIImage? = nil
    let url = "https://loremflickr.com/200/200/nature"
    
    
    var coreTable: [CoreTable] = []
    var tableCustomCell: [TableCustomCell] = []
    var descriptionOnAppear: [DescriptionOnAppear] = []
    var descriptionOnDisappear: [DescriptionOnDisappear] = []
    var taskDemonstration: [TaskDemonstration] = []
    
    private let dataCoreTable = DataManager()
    var typeGesture: [GestureType]
    
    init(typeGesture: [GestureType]) {
        self.typeGesture = typeGesture
        loadCoreTable()
        loadTableCustomCells()
        loadOnAppearData()
        loadTask()
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
    
    func loadOnDisappearData() {
        let descriptionOnDisappear = dataCoreTable.getOnDisappearData()
        self.descriptionOnDisappear = descriptionOnDisappear
    }
    
    func startTimer() {
        stopTimer()
        
        timerOnDisappear = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { [weak self] _ in
            DispatchQueue.main.async {
                self?.counterOnDisappear += 1
            }
        }
        isRunning = true
    }
    
    func stopTimer() {
        timerOnDisappear?.invalidate()
        timerOnDisappear = nil
        isRunning = false
    }
    
    func loadTask(){
        let taskDemonstration = dataCoreTable.getOnTaskData()
        self.taskDemonstration = taskDemonstration
    }
    
    func fetchImageData(url: String) async {
        do {
            guard let url = URL(string: url) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            self.imageTask = UIImage(data: data)
            
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
