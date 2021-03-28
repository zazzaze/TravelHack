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
    private let logoView = UIImageView()
    private let backgroundImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        configureSubviews()
        addSubviews()
        initConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        takeServiceButton.rightImage = UIImage(systemName: "chevron.right")
        bookingButton.rightImage = UIImage(systemName: "chevron.right")
    }
    
    private func configureSubviews() {
        configureRoundedView()
        configureWelcomeLabel()
        configureBackgroundView()
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
        configureLogoView()
    }
    
    private func configureTakeServiceButton() {
        takeServiceButton.setTitle("Забронировать услугу", for: .normal)
        takeServiceButton.cornerRadius = 8
        takeServiceButton.translatesAutoresizingMaskIntoConstraints = false
        takeServiceButton.setTitleColor(UIColor(named: "Main"), for: .normal)
        takeServiceButton.addTarget(self, action: #selector(openServicesView), for: .touchUpInside)
        takeServiceButton.setImage(UIImage(named: "document"), for: .normal)
        takeServiceButton.imageRightPadding = 21
        takeServiceButton.accessibilityLabel = "Забронировать услугу"
        takeServiceButton.isAccessibilityElement = true
    }
    
    private func configureBookingButton() {
        bookingButton.setTitle("Мои бронирования", for: .normal)
        bookingButton.cornerRadius = 8
        bookingButton.translatesAutoresizingMaskIntoConstraints = false
        bookingButton.setTitleColor(UIColor(named: "Main"), for: .normal)
        bookingButton.setImage(UIImage(named: "tick"), for: .normal)
        bookingButton.imageRightPadding = 21
        bookingButton.addTarget(self, action: #selector(openAllBooks), for: .touchUpInside)
        bookingButton.accessibilityLabel = "Кнопка отмены бронирования"
    }
    
    private func configureLogoView() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = UIImage(named: "domodedovo")
        logoView.contentMode = .scaleAspectFill
    }
    
    private func addRoundedViewSubviews() {
        roundedView.addSubview(takeServiceButton)
        roundedView.addSubview(bookingButton)
        roundedView.addSubview(logoView)
    }
    
    private func initRoundedViewConstraints() {
        NSLayoutConstraint.activate([
            takeServiceButton.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            takeServiceButton.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 65),
            takeServiceButton.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 34),
            takeServiceButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -34),
            takeServiceButton.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 0.1),
            
            bookingButton.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            bookingButton.topAnchor.constraint(equalTo: takeServiceButton.bottomAnchor, constant: 32),
            bookingButton.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 34),
            bookingButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -34),
            bookingButton.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 0.1),
            
            logoView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -52.6),
            logoView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 37),
            logoView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -37),
        ])
    }
    
    private func configureWelcomeLabel() {
        welcomeLabel.text = "Добро пожаловать!"
        welcomeLabel.textColor = UIColor(named: "White")
        welcomeLabel.font = UIFont.systemFont(ofSize: 35)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureBackgroundView() {
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.4)
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(roundedView)
        view.addSubview(welcomeLabel)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            roundedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            roundedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            roundedView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    @objc private func openServicesView() {
        navigationController?.pushViewController(ServicesViewController(), animated: true)
    }
    
    @objc private func openAllBooks() {
        navigationController?.pushViewController(AllBookingsViewController(), animated: true)
    }
}
