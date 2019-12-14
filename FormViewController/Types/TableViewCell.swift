//
//  TableViewCell.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 12.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

class TableCellRow<ViewModel: RowViewModel>: UITableViewCell {
    var viewModel: ViewModel? {
        didSet {
            updateView()
        }
    }

    func updateView() {
        guard let viewModel = self.viewModel,
            let cellStyles = viewModel.style else { return }

        for style in cellStyles {
            switch style {
            case let .selectionStyle(selectionStyle):
                self.selectionStyle = selectionStyle
            }
        }
    }
}
