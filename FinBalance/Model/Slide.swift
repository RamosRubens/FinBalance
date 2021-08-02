//
//  Slide.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 23/07/21.
//

import Foundation

struct Slide {
    
    let lottieAnimation: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
        Slide(lottieAnimation: "lottieGrowth", title: "Hora de começar!",description: "acompanhe todos os seus ativos em um só lugar!" ),
        Slide(lottieAnimation: "lottieIdea", title: "Aporte com confiança!", description: "aporte somente nos ativos que mais irá rentabilizar!"),
        Slide(lottieAnimation: "lottiePlant", title: "Siga seu Planejamento!", description: "tenha uma carteira balanceada e segura!")
    ]
}
