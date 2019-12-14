//
//  TableViewStyle.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 14.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

enum TableViewCellStyle {
    typealias RawValue = Int

    case selectionStyle(UITableViewCell.SelectionStyle)

    private var rawValue: RawValue {
        switch self {
        case .selectionStyle:
            return 0
        }
    }
}

extension TableViewCellStyle: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
