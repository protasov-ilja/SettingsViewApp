//
//  DisclosureTextCellData.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 22.10.2021.
//

import UIKit

public struct DisclosureTextCellData {
    public let text: String
    public let iconName: String
    public let iconBackgroundColor: UIColor
    public let disclosureText: String

    public init(text: String, disclosureText: String, iconName: String, iconBackgroundColor: UIColor) {
        self.text = text
        self.iconName = iconName
        self.iconBackgroundColor = iconBackgroundColor
        self.disclosureText = disclosureText
    }
}
