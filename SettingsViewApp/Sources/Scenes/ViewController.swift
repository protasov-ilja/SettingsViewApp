//
//  ViewController.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 09.10.2021.
//

import UIKit

class ViewController: UIViewController {

    private var data = [[CellData(text: "Mobile network", accessoryType: .disclosureIcon, iconName: "antenna.radiowaves.left.and.right", backgroundColor: .green)]]

    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.allowsSelection = true;

        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()

      setupHierarchy()
      setupLayout()
      setupView()
    }

    private func setupHierarchy() {
        self.view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Metrics.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupLayout() {
        updateLayout(with: self.view.frame.size)
    }

    private func setupView() {
        self.view.backgroundColor = Metrics.backgroundColor
        self.navigationItem.title = Metrics.settingsTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) in self.updateLayout(with: size) }, completion: nil)
    }

    // MARK: - Private methods
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Metrics.cellIdentifier, for: indexPath) as! TableViewCell

        let cellData = self.data[indexPath.section][indexPath.row]
        setCellData(cellData, for: cell)

        return cell
    }

    private func setCellData(_ cellData: CellData, for cell: TableViewCell) {
        cell.textLabel?.text = cellData.text

        let imageView = cell.imageView!
        imageView.image = UIImage(systemName: cellData.iconName)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(Metrics.cellImageCornerRadius)
        imageView.backgroundColor = cellData.backgroundColor

        switch cellData.accessoryType {
        case .disclosureIcon:
            cell.accessoryType = .disclosureIndicator
            break
        }
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка /(self.data[indexPath.section][indexPath.row].text)/")
    }
}

// MARK: - Constants
extension ViewController {
    enum Metrics {
        static let backgroundColor: UIColor = .white

        static let settingsTitle: String = "Settings"

        static let cellIdentifier: String = "TableViewCell"

        static let cellImageCornerRadius = 5
    }
}
