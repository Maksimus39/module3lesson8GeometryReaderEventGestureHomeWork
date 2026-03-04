import Foundation
import UIKit

@Observable class CoreDataAppViewModel: CoreDataAppProtocol {
    let id: String = UUID().uuidString
    var isEditingCoreTable: Bool = false
    
    // state onAppear
    var isAppeared: Bool = false
    var appearCount: Int = 0
    
    // state onDisappear (таймер)
    var isRunning: Bool = false
    var counterOnDisappear: Int = 0
    var timerOnDisappear: Timer? = nil
    let timerInterval: Double = 1.0
    let initialCounter: Int = 0
    
    // state task
    var imageTask: UIImage? = nil
    let url = "https://loremflickr.com/200/200/nature"
    
    // state blurAmount
    var blurAmount: Double = 0.0
    
    // state tapGeture
    var isSelected: Bool = false
    
    // state LongPressGesture
    var isCompletedLongPressGesture: Bool = false
    
    // state DragGesture
    var isAnimating: Bool = false
    var imageScale: CGFloat = 1
    var imageOffSet: CGSize = .zero
    
    // state geometryProxy
    var offset = CGSize.zero
    var isDragging = false
    
    // state animation
    var onLeftSide: Bool = false
    var barWidth: CGFloat = 300
    var barHeight: CGFloat = 24
    var markerWidth: CGFloat {
        barWidth / 3
    }
    
    var markerOfSet: CGFloat {
        barWidth * 0.65
    }
    
    // -----------------------------------------------
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
