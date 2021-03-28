//
//  ElementsForm.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

protocol ElementsFormDelegate: class {
    func popViewTapped()
    func nextViewButtonTapped()
    func toRoot()
}

class ElementsForm: UIView {

    private var formElementViews: [FormElementView]?
    var backButton = UIButton()
    var nextViewButton = UIButton()
    var toRootViewControllerButton = UIButton()
    
    var nextViewButtonText: String? {
        get {
            nextViewButton.titleLabel?.text
        }
        set {
            nextViewButton.setTitle(newValue?.uppercased(), for: .normal)
        }
    }
    
    var delegate: ElementsFormDelegate?

    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        backButton.setImage(UIImage(named: "backArrow"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(backButton)
        
        nextViewButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nextViewButton)
        toRootViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        toRootViewControllerButton.setTitle("К списку", for: .normal)
        toRootViewControllerButton.addTarget(self, action: #selector(toRootButtonTapped), for: .touchUpInside)
        toRootViewControllerButton.setTitleColor(UIColor(named: "Main"), for: .normal)
        addSubview(toRootViewControllerButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 33),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            
            nextViewButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            nextViewButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            toRootViewControllerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            toRootViewControllerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
        
        let gradient = CAGradientLayer()
        
        gradient.frame = nextViewButton.frame
        gradient.colors = [UIColor(named: "Primary")!.cgColor, UIColor(named: "BottomGradient")!.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)

        nextViewButton.layer.insertSublayer(gradient, at: 0)
        nextViewButton.setTitle("Далее".uppercased(), for: .normal)
        nextViewButton.setTitleColor(.black, for: .normal)
        nextViewButton.addTarget(self, action: #selector(nextViewButtonTapped), for: .touchUpInside)
        nextViewButton.layer.cornerRadius = 15
        nextViewButton.clipsToBounds = true
    }
    
    func addFormElementViews(_ views: [FormElementView]) {
        self.formElementViews = views
        if views.count == 0 {
            return
        }
        
        views.first!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(views.first!)
        
        NSLayoutConstraint.activate([
            views.first!.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            views.first!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            views.first!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        for i in 1..<views.count {
            views[i].translatesAutoresizingMaskIntoConstraints = false
            addSubview(views[i])
            NSLayoutConstraint.activate([
                views[i].topAnchor.constraint(equalTo: views[i - 1].bottomAnchor, constant: 10),
                views[i].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                views[i].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ])
        }
        
        views.last!.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
        
    }
    
    @objc private func backButtonTapped() {
        delegate?.popViewTapped()
    }
    
    @objc private func nextViewButtonTapped() {
        delegate?.nextViewButtonTapped()
    }
    
    @objc private func toRootButtonTapped() {
        delegate?.toRoot()
    }
}
