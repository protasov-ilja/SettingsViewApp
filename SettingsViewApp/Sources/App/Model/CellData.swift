//
//  CellData.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 10.10.2021.
//

import UIKit

public struct CellData {
    public let text: String
    public let accessoryType: AccessoryType
    public let iconName: String
    public let backgroundColor: UIColor

    public init(text: String, accessoryType: AccessoryType, iconName: String, backgroundColor: UIColor) {
        self.text = text
        self.accessoryType = accessoryType
        self.iconName = iconName
        self.backgroundColor = backgroundColor
    }
}
