//
//  MessageDisplayable.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

import UIKit

protocol MessageDisplayable {

}

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AppLocalized.okButton, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
