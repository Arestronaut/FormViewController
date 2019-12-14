//
//  Row.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 12.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

protocol RowType {
    func register(in tableView: UITableView)
    func dequeueCell(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell?
    func willDisplay(cell: UITableViewCell, indexPath: IndexPath)
    func didSelect(cell: UITableViewCell, indexPath: IndexPath)
}

struct Row<ViewModel: RowViewModel>: RowType {
    let cell: TableCellRow<ViewModel>.Type
    let viewModel: ViewModel

    func register(in tableView: UITableView) {
        tableView.register(cellOfType: cell)
    }

    func dequeueCell(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell? {
        guard let tableViewCell = tableView.dequeue(
            cellOfType: cell,
            indexPath: indexPath
        ) as? TableCellRow<ViewModel> else { return nil }
        tableViewCell.viewModel = viewModel
        return tableViewCell
    }

    func willDisplay(cell: UITableViewCell, indexPath: IndexPath) {
        guard let typedCell = cell as? TableCellRow<ViewModel> else { return }
        viewModel.onDisplayClosure?(typedCell, indexPath)
    }

    func didSelect(cell: UITableViewCell, indexPath: IndexPath) {
        guard let typedCell = cell as? TableCellRow<ViewModel> else { return }
        viewModel.onDidSelectClosure?(typedCell, indexPath)
    }
}
