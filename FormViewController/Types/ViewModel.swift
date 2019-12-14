//
//  ViewModel.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 12.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

protocol RowViewModel {
    var style: Set<TableViewCellStyle>? { get set }

    var onDisplayClosure: ((TableCellRow<Self>, IndexPath) -> Void)? { get set }
    var onDidSelectClosure: ((TableCellRow<Self>, IndexPath) -> Void)? { get set }

    mutating func onDisplay(_ closure: @escaping (TableCellRow<Self>, IndexPath) -> Void)
    mutating func didSelect(_ closure: @escaping (TableCellRow<Self>, IndexPath) -> Void)
}

extension RowViewModel {
    mutating func onDisplay(_ closure: @escaping (TableCellRow<Self>, IndexPath) -> Void) {
        self.onDisplayClosure = closure
    }

    mutating func didSelect(_ closure: @escaping (TableCellRow<Self>, IndexPath) -> Void) {
        self.onDidSelectClosure = closure
    }
}
