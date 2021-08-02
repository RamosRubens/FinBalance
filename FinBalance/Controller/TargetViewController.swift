//
//  TargetViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 30/07/21.
//

import UIKit
import Alamofire
import Loaf

class TargetViewController: UIViewController, UIAnimatable {

    private var targets: [Target] = []

    @IBOutlet weak var targetTable: UITableView!
    
    @IBAction func salvarButtonTapped(_ sender: Any) {
        for item in targets {
            let targetRequest = TargetRequest(id: item.id, percentInWallet: item.percentInWallet)
            changeValuesTarget(endpoint: "targets/", item: targetRequest)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViews()
        showLoadingAnimation()
        getAllTargets(endpoint: "targets")
    }
    
    private func setupTableViews(){
        targetTable.delegate = self
        targetTable.dataSource = self
        self.targetTable.rowHeight = UITableView.automaticDimension
    }
}

extension TargetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return targets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.targetCellId , for: indexPath) as! TargetTableViewCell
        cell.configure(with: targets[indexPath.item])
        return cell
    }
}

extension TargetViewController {
    func getAllTargets(endpoint: String){
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
                    let targets = try JSONDecoder().decode([Target].self, from: result)
                    self.targets = targets
                    self.targetTable.reloadData()
                }catch{
                    self.hideLoadingAnimation()
                    print(error)
                }
        }
    }
    
    func changeValuesTarget(endpoint: String, item: TargetRequest){
        let parameters: [String: [Float]] = [
            "targetValue": [item.percentInWallet]
        ]
        AF.request(K.Urls.finbalanceapi + endpoint + item.id.stringValue,
                   method: .put,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default, headers: nil,
                   interceptor: nil)
            .responseData(completionHandler: { (response) in
                guard let result = response.data else { return }
                do{
                    self.hideLoadingAnimation()
                    let resultado = try JSONDecoder().decode(ResponseResult.self, from: result)
                    Loaf(resultado.message, state: .success, location: .top, sender: self).show()
                }catch{
                    self.hideLoadingAnimation()
                    Loaf(error.localizedDescription, state: .error, location: .top, sender: self).show()
                }
            })
    }
}
