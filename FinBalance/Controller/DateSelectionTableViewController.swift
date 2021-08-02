//
//  DateSelectionTableViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 28/07/21.
//

import UIKit

class DateSelectionTableViewController: UITableViewController {
    
    var timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted?
    private var monthInfos: [MonthInfo] = []
    var selectedIndex: Int?
    var didSelectDate: ((Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonthInfos()
        setupTableView()
    }
    
    private func setupTableView(){
        self.modalPresentationStyle = .fullScreen
    }
    
    private func setupMonthInfos() {
        monthInfos = timeSeriesMonthlyAdjusted?.getMonthInfos() ?? []
    }

}

extension DateSelectionTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthInfos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.dateCellId, for: indexPath) as! DateSelectionTableViewCell
        let index = indexPath.item
        let monthInfo = monthInfos[indexPath.item]
        let isSelected = index == selectedIndex
        cell.configure(with: monthInfo, index: index, isSelected: isSelected)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectDate?(indexPath.item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
