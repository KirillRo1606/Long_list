import UIKit
import SnapKit

final class ListViewController: UIViewController {

// MARK: - Properties

    private var tableElementsData = TableElementsData.getData()
    private let dataCell = "dataCell"

// MARK: - UI Elements

    private let elementsTableView = UITableView()
    private let editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitle("Done", for: .selected)
        editButton.layer.cornerRadius = 10
        editButton.backgroundColor = .red
        editButton.setTitleColor(.white, for: .normal)
        return editButton
    }()

// MARK: - View Did Load Method

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
    }

// MARK: - View Will Appear Method

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

// MARK: - View Will Disappear Method

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Add Views Method

extension ListViewController {
    private func addViews() {
        addButtonAction()
        addElementsTableView()
        view.addSubview(editButton)
        view.addSubview(elementsTableView)
    }
}

// MARK: - Constraints

extension ListViewController {
    private func addConstraints() {
        view.backgroundColor = .white

        editButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }

        elementsTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(editButton.snp.bottom).offset(5)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - Table View Methods

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    private func addElementsTableView() {
        elementsTableView.register(TableElementCell.self, forCellReuseIdentifier: dataCell)
        elementsTableView.dataSource = self
        elementsTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableElementsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: dataCell, for: indexPath) as! TableElementCell)
        cell.tableElement = tableElementsData[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let elementInfoViewController = ElementInfoViewController()
        elementInfoViewController.tableElement = tableElementsData[indexPath.row]
        navigationController?.pushViewController(elementInfoViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableElementsData.remove(at: indexPath.row)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let elementToMove = tableElementsData[sourceIndexPath.row]
        tableElementsData.insert(elementToMove, at: destinationIndexPath.row)
        tableElementsData.remove(at: sourceIndexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

// MARK: - Button Method

extension ListViewController {
    private func addButtonAction(){
        editButton.addTarget(self, action: #selector(editPush(sender:)), for: .touchUpInside)
    }
    
    @objc func editPush(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        elementsTableView.setEditing(sender.isSelected, animated: true)
    }
}
