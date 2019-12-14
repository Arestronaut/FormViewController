//
//  SwitchRow.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 15.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

struct SwitchRowViewModel: RowViewModel {
    var style: Set<TableViewCellStyle>?

    var onDisplayClosure: ((TableCellRow<SwitchRowViewModel>, IndexPath) -> Void)?
    var onDidSelectClosure: ((TableCellRow<SwitchRowViewModel>, IndexPath) -> Void)?

    var title: String
    var isOn: Bool
}

final class SwitchRow: TableCellRow<SwitchRowViewModel> {
    override func updateView() {
        super.updateView()

        guard let viewModel = self.viewModel else { return }
        textLabel?.text = viewModel.title

        let switchView: UISwitch = .init()
        switchView.isOn = viewModel.isOn

        addSubview(switchView)
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        switchView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
    }
}
