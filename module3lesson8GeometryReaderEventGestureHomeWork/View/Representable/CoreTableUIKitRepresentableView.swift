import SwiftUI

struct CoreTableUIKitRepresentableView: UIViewRepresentable {
    let coreTableUIKitRepresentableView: String = "CoreTableUIKitRepresentableView"
    @Environment(CoreDataAppViewModel.self) var viewModel
    var isEditing: Binding<Bool>
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var parent: CoreTableUIKitRepresentableView
        
        init(_ parent: CoreTableUIKitRepresentableView) {
            self.parent = parent
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            parent.viewModel.coreTable.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.viewModel.coreTable.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: parent.coreTableUIKitRepresentableView, for: indexPath)
            let data = parent.viewModel.coreTable[indexPath.section]
            
            var config = cell.defaultContentConfiguration()
            
            config.text = data.title
            config.textProperties.numberOfLines = 0
            
            config.textProperties.font = UIFont(
                name: GeistLiterataFont.geistMedium.rawValue,
                size: 20
            ) ?? UIFont.systemFont(ofSize: 20)
            
            if let image = UIImage(named: data.image) {
                config.image = image
                config.imageProperties.maximumSize = CGSize(width: 90, height: 90)
                config.imageProperties.cornerRadius = 10
            }
            
            cell.contentConfiguration = config
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let data = parent.viewModel.coreTable[section]
            
            let headerView = UIView()
            headerView.backgroundColor = .clear
            
            let label = UILabel()
            label.numberOfLines = 0 
            label.text = data.footer
            label.font = UIFont(
                name: GeistLiterataFont.literataRegularBold.rawValue,
                size: 17
            ) ?? UIFont.systemFont(ofSize: 18)
            label.textColor = .secondaryLabel
            label.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(label)
      
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
                label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
                label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
            ])
            
            return headerView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            parent.isEditing.wrappedValue = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        {
            $0.dataSource = context.coordinator
            $0.delegate = context.coordinator
            $0.register(UITableViewCell.self, forCellReuseIdentifier: coreTableUIKitRepresentableView)
            $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            
            $0.estimatedRowHeight = 100
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedSectionHeaderHeight = 100
            $0.sectionHeaderHeight = UITableView.automaticDimension
            
            $0.tableFooterView = UIView(frame: .zero)
            return $0
        }(UITableView(frame: .zero, style: .plain))
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
}
