//
//  FormViewController.swift
//  FormViewController
//
//  Created by Raoul Schwagmeier on 08.12.19.
//  Copyright © 2019 Raoul Schwagmeier. All rights reserved.
//

import UIKit

class FormViewController: UITableViewController {
    private var sections: [Section]

    init(withSections sections: [Section]) {
        self.sections = sections
        super.init(style: .grouped)

        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        for row in sections.flatMap({ $0.rows }) {
            row.register(in: tableView)
        }

        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].rows[indexPath.row].dequeueCell(in: tableView, for: indexPath) ?? .init()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        row.willDisplay(cell: cell, indexPath: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let row = sections[indexPath.section].rows[indexPath.row]
        row.didSelect(cell: cell, indexPath: indexPath)
    }
}
