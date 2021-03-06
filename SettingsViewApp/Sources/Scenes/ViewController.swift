//
//  ViewController.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 09.10.2021.
//

import UIKit

class ViewController: UIViewController {

    private var data = [SectionData(cells: [
        .switchCell(withData: SwitchCellData(text: "Airplane mode", iconName: "airplane", iconBackgroundColor: .orange, isOnByDefault: true)),
        .disclosureTextCell(withData: DisclosureTextCellData(text: "Wi-Fi", disclosureText: "Not connected", iconName: "wifi", iconBackgroundColor: .link)),
        .disclosureTextCell(withData: DisclosureTextCellData(text: "Bluetooth", disclosureText: "On", iconName: "bluetooth", iconBackgroundColor: .link)),
        .defaultCell(withData: DefaultCellData(text: "Mobile network", iconName: "antenna.radiowaves.left.and.right", iconBackgroundColor: .systemGreen)),
        .defaultCell(withData: DefaultCellData(text: "Personal hotspot", iconName: "personalhotspot", iconBackgroundColor: .green)),
        .switchCell(withData: SwitchCellData(text: "VPN", iconName: "airplane", iconBackgroundColor: .orange, isOnByDefault: true)),
    ]), SectionData(cells: [
        .defaultCell(withData: DefaultCellData(text: "Notifications", iconName: "square", iconBackgroundColor: .red)),
        .defaultCell(withData: DefaultCellData(text: "Sounds & Haptics", iconName: "speaker.wave.3.fill", iconBackgroundColor: .systemPink)),
        .defaultCell(withData: DefaultCellData(text: "Do Not Disturb", iconName: "moon.fill", iconBackgroundColor: .systemPurple)),
        .defaultCell(withData: DefaultCellData(text: "Screen time", iconName: "hourglass", iconBackgroundColor: .systemPurple)),
    ]), SectionData(cells: [
        .defaultCell(withData: DefaultCellData(text: "General", iconName: "gear", iconBackgroundColor: .gray)),
        .defaultCell(withData: DefaultCellData(text: "Display & Brightness", iconName: "textformat.size", iconBackgroundColor: .systemBlue)),
        .defaultCell(withData: DefaultCellData(text: "Battry", iconName: "battery.100", iconBackgroundColor: .systemGreen)),
        .defaultCell(withData: DefaultCellData(text: "Privacy", iconName: "hand.raised.fill", iconBackgroundColor: .systemBlue)),
    ])]

    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(TableViewDefaultCell.self, forCellReuseIdentifier: TableViewDefaultCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(DisclosureButtonTableViewCell.self, forCellReuseIdentifier: DisclosureButtonTableViewCell.identifier)
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        self.view.addSubview(tableView)
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
        self.tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = data[indexPath.section].cells[indexPath.row]

        switch cellData {
        case .defaultCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewDefaultCell.identifier, for: indexPath) as? TableViewDefaultCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        case .switchCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        case .disclosureTextCell(let cellData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DisclosureButtonTableViewCell.identifier, for: indexPath) as? DisclosureButtonTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(with: cellData)

            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let type = self.data[indexPath.section].cells[indexPath.row]
        switch type {
        case .defaultCell(let cellData):
            print("???????????? ???????????? \(cellData.text)")
        case .switchCell(let cellData):
            print("???????????? ???????????? \(cellData.text)")
        case .disclosureTextCell(let cellData):
            print("???????????? ???????????? \(cellData.text)")
        }
    }
}

// MARK: - Constants
extension ViewController {
    enum Metrics {
        static let backgroundColor: UIColor = .white

        static let settingsTitle: String = "Settings"

        static let cellImageCornerRadius = 5
    }
}
