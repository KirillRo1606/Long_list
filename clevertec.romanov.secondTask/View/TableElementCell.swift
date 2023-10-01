import UIKit
import SnapKit

final class TableElementCell: UITableViewCell {

// MARK: - Properties

    var tableElement: TableElement? {
        didSet {
            elementImageView.image = tableElement?.image
            titleLabel.text = tableElement?.title
            descriptionLabel.text = tableElement?.description
        }
    }

// MARK: - UI Elements

    private let imageBackgrounView = ImageBackgrounView.setBackground()
    private let elementImageView = UIImageView()
    private let titleLabel = TitleLabel.setLabel()
    private let descriptionLabel = DesciptionLabel.setLabel()
    private let textElementsStackView: UIStackView = {
        let textElementsStackView = UIStackView()
        textElementsStackView.axis = .vertical
        textElementsStackView.alignment = .leading
        textElementsStackView.spacing = 5
        return textElementsStackView
    }()

// MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
}

// MARK: - Add Views Method

extension TableElementCell {
    private func addViews() {
        imageBackgrounView.addSubview(elementImageView)
        self.contentView.addSubview(imageBackgrounView)
        [titleLabel, descriptionLabel].forEach { label in
            textElementsStackView.addArrangedSubview(label)
        }
        self.contentView.addSubview(textElementsStackView)
    }
}

// MARK: - Constraints

extension TableElementCell {
    private func addConstraints() {
        imageBackgrounView.layer.cornerRadius = 30
        imageBackgrounView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.size.equalTo(60)
        }

        elementImageView.snp.makeConstraints { make in
            make.center.equalTo(imageBackgrounView)
            make.size.equalTo(40)
        }

        textElementsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY).offset(-10)
            make.leading.equalTo(imageBackgrounView.snp.trailing).offset(20)
            make.height.equalTo(60)
        }
    }
}
