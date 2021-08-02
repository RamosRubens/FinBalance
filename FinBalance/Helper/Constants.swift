//
//  Constants.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 22/07/21.
//

import Foundation

struct K {
    struct FontName {
        static let avenirMedium = "Avenir-Medium"
    }
    struct Segue {
        static let showOnbording = "showOnbording"
        static let showLoginSignUp = "showLoginSignUp"
        static let showCalculator = "showCalculator"
        static let showDate = "showDateSelection"
    }
    
    struct StorybordID {
        static let main = "Main"
        static let mainTabBarController = "mainTabBarController"
        static let onbordingController = "onbordingViewController"
        static let calculator = "Calculator"
    }
    
    struct Id {
        static let onBordingCellId = "cellId"
        static let companyCellId = "cellCompanyId"
        static let searchImageId = "imCalculator"
        static let dateCellId = "dateCell"
        static let targetCellId = "targetCell"
        static let ativosCellId = "ativosCell"
        static let ativosWalletCellId = "ativosWalletCell"
        static let balanceCellId = "balanceCell"
    }
    
    struct Titles {
        static let settingsTitle = "Settings"
        static let homeTitle = "Home"
        static let searchTitle = "Pesquisar"
        static let forgetPasswordTitle = "Esqueceu a senha"
        static let cancel = "Cancelar"
        static let ok = "Ok"
        static let alertForgetPassword = "Email enviado com sucesso!"
    }
    
    struct messages {
        static let errorCredendials = "Credenciais incorretas. Por favor, tente novamente!"
        static let errorInvalidForm = "Preenchimento inválido, tente novamente!"
        static let errorPasswordsNotEquals = "Senhas não conferem!"
        static let informationEnterEmailAdress = "Por favor, informe seu email."
        static let alertForgetPassword = "Por favor, verifique seu email para resetar a senha."
        static let noSearchMessage = "Pesquise a empresa para calcular o seu potencial de retorno!"
        static let hideTotal = "- - - - - -"
    }
    
    struct Urls {
        static let finbalanceapi = "https://finbalanceapi.herokuapp.com/"
    }
}
