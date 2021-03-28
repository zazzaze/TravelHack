//
//  ServicesViewController.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit

class ServicesViewController: UIViewController {

    private let servicesNames =  [
        ServiceEntity(name: "Сопровождение", image: UIImage(named: "escort")!), ServiceEntity(name: "Бизнес-зал", image: UIImage(named: "business")!), ServiceEntity(name: "VIP зал", image: UIImage(named: "vip")!)]
    private let reuseIdentifier = "collectionCell"

    private var navigationBar = CustomNavigationBar()
    private var collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.scrollDirection = .vertical
        layer.minimumLineSpacing = 60
        return UICollectionView(frame: .zero, collectionViewLayout: layer)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        addSubviews()
        initConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    private func configureSubviews() {
        configureNavigationBar()
        configureCollectionView()
    }
    
    private func configureNavigationBar() {
        navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.13)
        let gradient = CAGradientLayer()

        gradient.frame = navigationBar.bounds
        gradient.colors = [UIColor(named: "Primary")!.cgColor, UIColor(named: "BottomGradient")!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)

        navigationBar.layer.insertSublayer(gradient, at: 0)
        
        navigationBar.titleLabel.text = "Услуги"
        navigationBar.barDelegate = self
    }
    
    private func configureCollectionView() {
        collectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
    }
    
    private func addSubviews() {
        view.addSubview(navigationBar)
        view.addSubview(collectionView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationBar.frame.height + 75),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }

}

extension ServicesViewController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ServicesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}

extension ServicesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicesNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ServiceCollectionViewCell
        cell.titleLabel.text = servicesNames[indexPath.row].name
        return cell
    }
    
    
}

extension ServicesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            return
        }
        DispatchQueue.global(qos: .utility).async {
            ServerService().loadFormPage { serviceRequest in
                guard let serviceRequest = serviceRequest else {
                    return
                }
                let view = AllElementsViewController(serviceRequest: serviceRequest)
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(view, animated: true)
                }
            }
        }
    }
}
