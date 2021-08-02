//
//  Helper.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 22/07/21.
//

import Foundation

func delay(durationInSeconds seconds: Double, completion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
