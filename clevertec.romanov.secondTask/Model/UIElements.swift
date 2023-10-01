import UIKit

// MARK: - UI Elements

final class ImageBackgrounView: UIView {
    static func setBackground() -> UIView {
        let imageBackgrounView = UIView()
        imageBackgrounView.alpha = 0.65
        imageBackgrounView.backgroundColor = .lightGray
        return imageBackgrounView
    }
}

final class TitleLabel: UILabel {
    static func setLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .darkGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }
}

final class DesciptionLabel: UILabel {
    static func setLabel() -> UILabel {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }
}
