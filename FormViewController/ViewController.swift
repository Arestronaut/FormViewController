//
//  ViewController.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 08.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var detailViewModel: DetailRowViewModel = .init(title: "Test", detail: "Detail")
        detailViewModel.style = [.selectionStyle(.none)]
        detailViewModel.onDisplay { cell, indexPath in
            print("WillDisplay: \(cell.viewModel?.title)")
        }

        detailViewModel.didSelect { cell, indexPath in
            print("DidSelect: \(cell.viewModel?.title)")
        }

        var detailRow: Row<DetailRowViewModel> = .init(cell: DetailRow.self, viewModel: detailViewModel)

        let formViewCtrl: FormViewController = .init(withSections: [.init(rows: [detailRow])])

        addChild(formViewCtrl)
        formViewCtrl.didMove(toParent: self)

        view.addSubview(formViewCtrl.tableView)
        formViewCtrl.tableView.translatesAutoresizingMaskIntoConstraints = false
        formViewCtrl.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        formViewCtrl.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        formViewCtrl.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        formViewCtrl.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

