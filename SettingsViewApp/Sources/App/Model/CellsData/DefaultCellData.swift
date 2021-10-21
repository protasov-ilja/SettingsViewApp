//
//  CellData.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 10.10.2021.
//

import UIKit

public struct DefaultCellData {
    public let text: String
    public let iconName: String
    public let iconBackgroundColor: UIColor

    public init(text: String, iconName: String, iconBackgroundColor: UIColor) {
        self.text = text
        self.iconName = iconName
        self.iconBackgroundColor = iconBackgroundColor
    }
}
