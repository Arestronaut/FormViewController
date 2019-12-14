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

        let firstNameViewModel: DetailRowViewModel = .init(title: "First Name", detail: "Max")
        let firstNameRow: Row<DetailRowViewModel> = .init(cell: DetailRow.self, viewModel: firstNameViewModel)

        let lastNameViewModel: DetailRowViewModel = .init(title: "Last Name", detail: "Musterman")
        let lastNameRow: Row<DetailRowViewModel> = .init(cell: DetailRow.self, viewModel: lastNameViewModel)

        let switchViewModel: SwitchRowViewModel = .init(title: "Send Data", isOn: true)
        let switchRow: Row<SwitchRowViewModel> = .init(cell: SwitchRow.self, viewModel: switchViewModel)

        let formViewCtrl: FormViewController = .init(
            withSections: [
                .init(rows: [firstNameRow, lastNameRow]),
                .init(rows: [switchRow])
            ]
        )

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

