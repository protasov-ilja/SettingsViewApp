//
//  TableViewCell.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 10.10.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()

        self.accessoryType = .none
        self.accessoryView = nil
    }
}
