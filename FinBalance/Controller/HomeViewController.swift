//
//  HomeViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 24/07/21.
//

import UIKit
import FirebaseAuth
import MBProgressHUD
import Loaf
import Alamofire

class HomeViewController: UIViewController, UIAnimatable {
    
    private var assets: [Assets] = []
    private var isShowingTotal: Bool = false
    private var totalInWallet: Double = 0

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var walletTotalView: UIView!
    @IBOutlet weak var assetsTableView: UITableView!
    @IBOutlet weak var hideTotal: UIButton!
    @IBOutlet weak var totalWallet: UILabel!
    
    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingAnimation()
        setupNavigationBar()
        setupViews()
        setupTableViews()
    }
    
    private func setupNavigationBar(){
        self.title = K.Titles.homeTitle
    }
    
    private func setupViews(){
        getAllAssets(endpoint: "assets/")
        if let email = Auth.auth().currentUser?.email {
            emailLabel.text = email
        }
        
        walletTotalView.layer.cornerRadius = 5
        walletTotalView.layer.borderWidth = 0
        walletTotalView.layer.masksToBounds = false
        walletTotalView.layer.shadowColor = UIColor.gray.cgColor
        walletTotalView.layer.shadowOpacity = 1
        walletTotalView.layer.shadowOffset = CGSize(width: 0, height: 3)
        walletTotalView.layer.shadowRadius = 4
        
        totalWallet.text = K.messages.hideTotal
    }
    
    private func setupTableViews(){
        assetsTableView.delegate = self
        assetsTableView.dataSource = self
        self.assetsTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func hideTotalTapped(_ sender: Any) {
        if isShowingTotal {
            totalWallet.text = K.messages.hideTotal
            hideTotal.setImage(UIImage(named: "eye.png"), for: .normal)
            isShowingTotal = !isShowingTotal
        } else {
            totalWallet.text =  "R$ \(getTotal(assets: assets).toCurrencyFormat(hasDollarSymbol: false, hasDecimalPlaces: true))"
            hideTotal.setImage(UIImage(named: "hidden.png"), for: .normal)
            isShowingTotal = !isShowingTotal
        }
    }
    
    private func getTotal(assets: [Assets]) -> Double {
        var totalInWallet: Double = 0
        
        for total in assets {
            totalInWallet = totalInWallet + total.totalInWallet
        }
        
        return totalInWallet
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) { [weak self] in
        guard let this = self else { return }
            let result = this.authManager.logout()
            
            switch result {
                case .success:
                    PresenterManager.shared.show(vc: .onbording)
                case .failure(let error):
                    Loaf(error.localizedDescription, state: .error, location: .top, sender: this).show()
            }
            MBProgressHUD.hide(for: this.view, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.ativosCellId , for: indexPath) as! HomeAssetsTableViewCell
        cell.configure(with: assets[indexPath.item])
        return cell
    }
}

extension HomeViewController {
    func getAllAssets(endpoint: String){
        AF.request(K.Urls.finbalanceapi + endpoint,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil)
            .response { response in
                guard let result = response.data else { return }
                do{
                    self.hideLoadingAnimation()
                    let asset = try JSONDecoder().decode([Assets].self, from: result)
                    self.assets = asset
                    self.totalInWallet = self.getTotal(assets: asset)
                    self.assetsTableView.reloadData()
                }catch{
                    self.hideLoadingAnimation()
                    print(error)
                }
        }
    }
}
