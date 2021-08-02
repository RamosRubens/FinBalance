//
//  OnbordingCollectionViewCell.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 23/07/21.
//

import UIKit
import Lottie

class OnbordingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var animationView: AnimationView!
    
    func configure(with slide: Slide){
        let animation = Animation.named(slide.lottieAnimation)
        animationView.animation = animation
        animationView.loopMode = .loop
        if !animationView.isAnimationPlaying {
            animationView.play()
        }
    }
}
