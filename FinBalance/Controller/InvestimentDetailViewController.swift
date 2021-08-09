//
//  InvestimentDetailViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 09/08/21.
//

import UIKit

class InvestimentDetailViewController: UIViewController {

    @IBOutlet weak var percentAtual: UIView!
    @IBOutlet weak var percentTarget: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        percentAtual.layer.cornerRadius = 5
        percentAtual.layer.borderWidth = 0
        percentAtual.layer.masksToBounds = false
        percentTarget.layer.cornerRadius = 5
        percentTarget.layer.borderWidth = 0
        percentTarget.layer.masksToBounds = false
    }

}
