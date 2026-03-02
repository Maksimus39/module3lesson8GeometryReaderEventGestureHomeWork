import SwiftUI

struct TableCustomCellRepresentableView: UIViewRepresentable {
    @Environment(CoreDataAppViewModel.self) var viewModel
    let tableCustomCellRepresentableView: String = "TableCustomCellRepresentableView"
    @Binding var selectedGestureType: GestureType?
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var parent: TableCustomCellRepresentableView
        
        init(parent: TableCustomCellRepresentableView) {
            self.parent = parent
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.viewModel.tableCustomCell.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: parent.tableCustomCellRepresentableView, for: indexPath) as? CustomItemCell else {
                return UITableViewCell()
            }
            
            let data = parent.viewModel.tableCustomCell[indexPath.row]
            cell.configure(with: data)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let gesture = parent.viewModel.tableCustomCell[indexPath.row]
            parent.selectedGestureType = gesture.type
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        {
            $0.dataSource = context.coordinator
            $0.delegate = context.coordinator
            $0.register(CustomItemCell.self, forCellReuseIdentifier: tableCustomCellRepresentableView)
            $0.separatorStyle = .singleLine
            $0.backgroundColor = .clear
            $0.backgroundView = nil
            $0.tableFooterView = UIView()
            $0.estimatedRowHeight = 400
            $0.rowHeight = UITableView.automaticDimension
            return $0
        }(UITableView(frame: .zero, style: .plain))
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
}
