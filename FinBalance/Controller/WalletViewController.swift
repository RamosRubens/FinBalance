//
//  WalletViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 31/07/21.
//

import UIKit

class WalletViewController: UIViewController {
    
    private var assets: [AssetsInvested] = AssetsInvested.collection
    private var isShowingTotal: Bool = true

    @IBOutlet weak var walletTotalView: UIView!
    @IBOutlet weak var totalWalletLabel: UILabel!
    @IBOutlet weak var hideTotal: UIButton!
    @IBOutlet weak var assetsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    func setupView() {
        walletTotalView.layer.cornerRadius = 5
        walletTotalView.layer.borderWidth = 0
        walletTotalView.layer.masksToBounds = false
        walletTotalView.layer.shadowColor = UIColor.gray.cgColor
        walletTotalView.layer.shadowOpacity = 1
        walletTotalView.layer.shadowOffset = CGSize(width: 0, height: 3)
        walletTotalView.layer.shadowRadius = 4
        
        totalWalletLabel.text = "R$ \(getTotal(assets: assets).toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true))"
    }
    
    func setupTableView(){
        assetsTableView.delegate = self
        assetsTableView.dataSource = self
        self.assetsTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func getTotal(assets: [AssetsInvested]) -> Double {
        var totalInWallet: Double = 0
        
        for total in assets {
            totalInWallet = totalInWallet + total.totalInWallet
        }
        
        return totalInWallet
    }
    
    @IBAction func hideTotalTapped(_ sender: Any) {
        if isShowingTotal {
            totalWalletLabel.text = K.messages.hideTotal
            hideTotal.setImage(UIImage(named: "eye.png"), for: .normal)
            isShowingTotal = !isShowingTotal
        } else {
            totalWalletLabel.text =  "R$ \(getTotal(assets: assets).toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true))"
            hideTotal.setImage(UIImage(named: "hidden.png"), for: .normal)
            isShowingTotal = !isShowingTotal
        }
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.ativosWalletCellId, for: indexPath) as! AssetsWalletTableViewCell
        cell.configure(with: assets[indexPath.item])
        return cell
    }
}
