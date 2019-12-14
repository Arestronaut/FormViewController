//
//  UITableViewExtension.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 12.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

extension UITableView {
    func register<CellType: UITableViewCell>(cellOfType cellType: CellType.Type) {
        register(cellType, forCellReuseIdentifier: cellType.identifier)
    }

    func dequeue<CellType: UITableViewCell>(cellOfType cellType: CellType.Type, indexPath: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
    }
}
