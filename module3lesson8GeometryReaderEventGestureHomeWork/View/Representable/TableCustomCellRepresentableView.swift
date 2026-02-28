import SwiftUI

struct TableCustomCellRepresentableView: UIViewRepresentable {
    @Environment(CoreDataAppViewModel.self) var viewModel
    let tableCustomCellRepresentableView: String = "TableCustomCellRepresentableView"
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var parent: TableCustomCellRepresentableView
        
        init(parent: TableCustomCellRepresentableView) {
            self.parent = parent
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.viewModel.tableCustomCell.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: parent.tableCustomCellRepresentableView, for: indexPath) as? CustomItemCell else {
                return UITableViewCell()
            }
            
            let data = parent.viewModel.tableCustomCell[indexPath.row]
            cell.configure(with: data)
            
            return cell
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
            $0.separatorStyle = .none
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
    
    class CustomItemCell: UITableViewCell {
        
        lazy var customImageView: UIImageView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 14
            $0.backgroundColor = .systemGray5
            return $0
        }(UIImageView())
        
        lazy var titleLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont(name: GeistLiterataFont.geistMedium.rawValue, size: 18) ?? .systemFont(ofSize: 18, weight: .medium)
            $0.textColor = .label
            $0.numberOfLines = 1
            return $0
        }(UILabel())
        
        lazy var descriptionLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont(name: GeistLiterataFont.literataRegularBold.rawValue, size: 18) ?? .systemFont(ofSize: 18)
            $0.textColor = .secondaryLabel
            $0.numberOfLines = 4
            return $0
        }(UILabel())
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupCell() {
            contentView.addSubview(titleLabel)
            contentView.addSubview(customImageView)
            contentView.addSubview(descriptionLabel)
            
            NSLayoutConstraint.activate([
                // constraint titleLabel
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
                titleLabel.heightAnchor.constraint(equalToConstant: 18),
                
                // constraint customImageView
                customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                customImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                customImageView.heightAnchor.constraint(equalToConstant: 200),
                
                // constraint - descriptionLabel
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                descriptionLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 9),
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
            
            // Разрешаем многострочность для descriptionLabel
            descriptionLabel.numberOfLines = 0
            
            // accessoryType
            accessoryType = .none
        }
        
        func configure(with data: TableCustomCell) {
            titleLabel.text = data.title
            descriptionLabel.text = data.description
            
            if let image = UIImage(named: data.image) {
                customImageView.image = image
                customImageView.backgroundColor = .clear
                customImageView.tintColor = nil
            } else {
                customImageView.image = UIImage(systemName: "photo.fill")
                customImageView.tintColor = .systemGray
                customImageView.backgroundColor = .systemGray5
            }
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            customImageView.image = nil
            titleLabel.text = nil
            descriptionLabel.text = nil
        }
    }
}
