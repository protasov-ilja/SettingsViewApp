//
//  SwitchCellData.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 20.10.2021.
//

import UIKit

public struct SwitchCellData {
    public let text: String
    public let iconName: String
    public let iconBackgroundColor: UIColor
    public let isOnByDefault: Bool

    public init(text: String, iconName: String, iconBackgroundColor: UIColor, isOnByDefault: Bool) {
        self.text = text
        self.iconName = iconName
        self.iconBackgroundColor = iconBackgroundColor
        self.isOnByDefault = isOnByDefault
    }
}
