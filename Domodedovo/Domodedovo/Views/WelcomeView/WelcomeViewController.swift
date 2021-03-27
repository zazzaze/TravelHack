//
//  WelcomeViewController.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let roundedView = UIView()
    private let welcomeLabel = UILabel()
    private let takeServiceButton = CustomButton()
    private let bookingButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        configureSubviews()
        addSubviews()
        initConstraints()
    }
    
    private func configureSubviews() {
        configureRoundedView()
        configureWelcomeLabel()
    }
    
    private func configureRoundedView() {
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.clipsToBounds = true
        roundedView.layer.cornerRadius = 40
        roundedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        roundedView.backgroundColor = .white
        configureRoundedViewSubviews()
        addRoundedViewSubviews()
        initRoundedViewConstraints()
    }
    
    private func configureRoundedViewSubviews() {
        configureTakeServiceButton()
        configureBookingButton()
    }
    
    private func configureTakeServiceButton() {
        takeServiceButton.setTitle("Забронировать услугу", for: .normal)
        takeServiceButton.cornerRadius = 8
        takeServiceButton.translatesAutoresizingMaskIntoConstraints = false
        takeServiceButton.setTitleColor(UIColor(named: "Main"), for: .normal)
    }
    
    private func configureBookingButton() {
        bookingButton.setTitle("Отменить бронирование", for: .normal)
        bookingButton.cornerRadius = 8
        bookingButton.translatesAutoresizingMaskIntoConstraints = false
        bookingButton.setTitleColor(UIColor(named: "Main"), for: .normal)
    }
    
    private func addRoundedViewSubviews() {
        roundedView.addSubview(takeServiceButton)
        roundedView.addSubview(bookingButton)
    }
    
    private func initRoundedViewConstraints() {
        NSLayoutConstraint.activate([
            takeServiceButton.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            takeServiceButton.bottomAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: -16),
            takeServiceButton.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 34),
            takeServiceButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -34),
            takeServiceButton.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 0.08),
            
            bookingButton.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            bookingButton.topAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 16),
            bookingButton.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 34),
            bookingButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -34),
            bookingButton.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func configureWelcomeLabel() {
        welcomeLabel.text = "Добро пожаловать!"
        welcomeLabel.textColor = UIColor(named: "White")
        welcomeLabel.font = UIFont.systemFont(ofSize: 30)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        view.addSubview(roundedView)
        view.addSubview(welcomeLabel)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            roundedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.76),
            roundedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            roundedView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}
