//
//  OnbordingViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 23/07/21.
//

import UIKit

protocol OnbordingDelegate: UIViewController {
    func showMainTabBarController()
}

class OnbordingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var actionButton: UIButton!
    
    private let slides: [Slide] = Slide.collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        showCaption(atIndex: 0)
    }
    
    private func setupViews() {
        actionButton.layer.cornerRadius = 5
        actionButton.layer.borderWidth = 0
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupPageControl(){
        pageControl.numberOfPages = slides.count
    }
   
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segue.showLoginSignUp, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showLoginSignUp{
            if let destination = segue.destination as? LoginViewController {
                destination.delegate = self
            }
        }
    }
    
    private func showCaption(atIndex index: Int){
        let slide = slides[index]
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}

extension OnbordingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Id.onBordingCellId, for: indexPath) as? OnbordingCollectionViewCell else { return UICollectionViewCell()}
                
        let slide = slides[indexPath.item]
        cell.configure(with: slide)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            showCaption(atIndex: index)
        self.pageControl.currentPage = index
    }
}

extension OnbordingViewController: OnbordingDelegate {
    func showMainTabBarController() {
        if let loginViewController = self.presentedViewController as? LoginViewController {
            loginViewController.dismiss(animated: true) {
                PresenterManager.shared.show(vc: .mainTabBarController)
            }
        }
    }
}

