//
//  ViewController.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {

    private var textField = FormTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Test"
        //textField.label.text = "Номер полета"
        textField.setOutlineColor(.gray, for: .normal)
        textField.setOutlineColor(.green, for: .editing)
        textField.setOutlineColor(.brown, for: .disabled)
//        view.addSubview(textField)
//        NSLayoutConstraint.activate([
//            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            textField.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }


}

