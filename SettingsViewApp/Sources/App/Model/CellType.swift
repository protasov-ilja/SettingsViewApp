//
//  CellType.swift
//  SettingsViewApp
//
//  Created by Ilya Protasov on 20.10.2021.
//

enum CellType {
    case defaultCell(withData: DefaultCellData)
    case switchCell(withData: SwitchCellData)
    case disclosureTextCell(withData: DisclosureTextCellData)
}
