import UIKit

class CustomItemCell: UITableViewCell {
    
    lazy var customImageView = createImageView()
    lazy var titleLabel: UILabel = createLabel(
        font: UIFont(name: GeistLiterataFont.geistMedium.rawValue, size: 18) ?? .systemFont(ofSize: 18, weight: .medium),
        textColor: .label,
        numberOfLines: 1
    )
    lazy var descriptionLabel: UILabel = createLabel(
        font: UIFont(name: GeistLiterataFont.literataRegularBold.rawValue, size: 18) ?? .systemFont(ofSize: 18),
        textColor: .secondaryLabel,
        numberOfLines: 4
    )
    
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
            
            // constraint  descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 9),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        descriptionLabel.numberOfLines = 4
        accessoryType = .disclosureIndicator
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        imageView.backgroundColor = .systemGray5
        return imageView
    }
    
    private func createLabel(font: UIFont, textColor: UIColor, numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
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
