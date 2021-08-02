//
//  BalanceViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import UIKit

class BalanceViewController: UIViewController {

    @IBOutlet weak var balanceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
        balanceTableView.delegate = self
        balanceTableView.dataSource = self
        self.balanceTableView.rowHeight = UITableView.automaticDimension
    }
    
    
}

extension BalanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.balanceCellId, for: indexPath)
        return cell
    }
}
