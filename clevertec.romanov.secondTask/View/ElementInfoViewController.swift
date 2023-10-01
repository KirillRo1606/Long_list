import UIKit
import SnapKit

final class ElementInfoViewController: UIViewController {

// MARK: - Properties

    var tableElement: TableElement? {
        didSet {
            elementImageView.image = tableElement?.image
            titleLabel.text = tableElement?.title
            descriptionLabel.text = tableElement?.description
        }
    }

// MARK: - UI Elements

    private let infoView = UIView()
    private let imageBackgrounView = ImageBackgrounView.setBackground()
    private let elementImageView = UIImageView()
    private let titleLabel = TitleLabel.setLabel()
    private let descriptionLabel = DesciptionLabel.setLabel()
    private let textElementsStackView: UIStackView = {
        let textElementsStackView = UIStackView()
        textElementsStackView.axis = .vertical
        textElementsStackView.alignment = .center
        textElementsStackView.spacing = 10
        textElementsStackView.contentMode = .scaleToFill
        textElementsStackView.distribution = .fillProportionally
        return textElementsStackView
    }()

// MARK: - View Did Load Method

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
    }
}

// MARK: - Add Views Method

extension ElementInfoViewController {
    private func addViews() {
        view.addSubview(infoView)
        imageBackgrounView.addSubview(elementImageView)
        [imageBackgrounView, textElementsStackView].forEach { view in
            infoView.addSubview(view)
        }

        [titleLabel, descriptionLabel].forEach { label in
            textElementsStackView.addArrangedSubview(label)
        }
    }
}

// MARK: - Constraints

extension ElementInfoViewController {
    private func addConstraints() {
        view.backgroundColor = .white

        imageBackgrounView.layer.cornerRadius = 60
        imageBackgrounView.snp.makeConstraints { make in
            make.center.equalTo(infoView.snp.center)
            make.size.equalTo(120)
        }

        elementImageView.snp.makeConstraints { make in
            make.center.equalTo(imageBackgrounView)
            make.size.equalTo(80)
        }

        infoView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }

        textElementsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(infoView.snp.centerX)
            make.top.equalTo(imageBackgrounView.snp.bottom).offset(10)
        }
    }
}
