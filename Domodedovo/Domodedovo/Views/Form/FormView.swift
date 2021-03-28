//
//  FormView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class FormView: UIViewController {
    
    let titleLabel: UILabel = UILabel()
    let nextButton: UIButton = UIButton()
    private var elementForms: [ElementsForm]!
    private var index = 0
    
    convenience init(elementForms: [ElementsForm]) {
        self.init()
        self.elementForms = elementForms
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureSubviews()
        addSubviews()
        initConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        elementForms.first!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(elementForms.first!)
        NSLayoutConstraint.activate([
            elementForms.first!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            elementForms.first!.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45),
            elementForms.first!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        elementForms.first!.clipsToBounds = true
    }
    
    private func configureSubviews() {
        configureTitleLabel()
        configureNextButton()
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = UIColor(named: "Primary")
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.addTarget(self, action: #selector(nextElementForm), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    @objc func nextElementForm() {
        UIView.animate(withDuration: 1) {
            self.elementForms[self.index].frame.origin.x -= self.elementForms[self.index].frame.width + 100
        }
    }
}
