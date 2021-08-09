//
//  InvestimentViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 09/08/21.
//

import UIKit

class InvestimentViewController: UIViewController {

    var assets: Assets?
    @IBOutlet weak var percentCarteiraView: UIView!
    @IBOutlet weak var percentTargetView: UIView!
    @IBOutlet weak var investTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    func setupView() {
        percentCarteiraView.layer.cornerRadius = 5
        percentCarteiraView.layer.borderWidth = 0
        percentCarteiraView.layer.masksToBounds = false
        percentTargetView.layer.cornerRadius = 5
        percentTargetView.layer.borderWidth = 0
        percentTargetView.layer.masksToBounds = false
    }

    func setupTableView() {
        investTableView.delegate = self
        investTableView.dataSource = self
    }

}

extension InvestimentViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.investCellId, for: indexPath) as! InvestTableViewCell
        if let assetsCell = assets{
            cell.configure(with: assetsCell)
        }
        
        return cell
    }
    
    
}

