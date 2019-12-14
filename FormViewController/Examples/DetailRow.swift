//
//  DetailRow.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 12.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

struct DetailRowViewModel: RowViewModel {
    var style: Set<TableViewCellStyle>?

    var onDisplayClosure: ((TableCellRow<DetailRowViewModel>, IndexPath) -> Void)?
    var onDidSelectClosure: ((TableCellRow<DetailRowViewModel>, IndexPath) -> Void)?

    var title: String
    var detail: String
}

final class DetailRow: TableCellRow<DetailRowViewModel> {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateView() {
        super.updateView()

        guard let viewModel = self.viewModel else { return }
        textLabel?.text = viewModel.title
        detailTextLabel?.text = viewModel.detail
    }
}
