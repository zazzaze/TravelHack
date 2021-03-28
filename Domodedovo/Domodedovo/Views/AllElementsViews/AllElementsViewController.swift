//
//  AllElementsViewController.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit

class AllElementsViewController: UIViewController {
    
    private let navigationBar = CustomNavigationBar()
    private var collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.scrollDirection = .vertical
        layer.minimumLineSpacing = 20
        return UICollectionView(frame: .zero, collectionViewLayout: layer)
    }()
    
    private var serviceRequest: ServiceRequest!
    private var elements: [ServiceFormElement]!
    private let reuseIdentifier = "collectionCell"
    private var index = 0
    private var maxIndex = 0
    
    convenience init(serviceRequest: ServiceRequest) {
        self.init()
        self.serviceRequest = serviceRequest
        elements = serviceRequest.serviceFormPage.serviceFormElements
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.13)
        let gradient = CAGradientLayer()

        gradient.frame = navigationBar.bounds
        gradient.colors = [UIColor(named: "Primary")!.cgColor, UIColor(named: "BottomGradient")!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)

        navigationBar.layer.insertSublayer(gradient, at: 0)
        
        navigationBar.titleLabel.text = "Заявка"
        navigationBar.barDelegate = self
        
        collectionView.register(ElementCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(navigationBar)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationBar.frame.height + 75),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }

}

extension AllElementsViewController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension AllElementsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}

extension AllElementsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ElementCollectionViewCell
        cell.titleLabel.text = elements[indexPath.row].title
        if indexPath.row < maxIndex {
            cell.state = .success
        } else if indexPath.row == maxIndex {
            cell.state = .active
        } else {
            cell.state = .disable
        }
        return cell
    }
    
    
}

extension AllElementsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row > elements.count {
            return
        }
        let newVC = elements[indexPath.row].createViewController()
        newVC.elementsView?.delegate = self
        index = indexPath.row
        navigationController?.pushViewController(newVC, animated: true)
        
    }
}

extension AllElementsViewController: ElementsFormDelegate {
    func nextViewButtonTapped() {
        if index + 1 == elements.count {
            DispatchQueue.global(qos: .utility).async {
                ServerService().postRequest(request: self.serviceRequest) { isSuccess in
                    if isSuccess {
                        ServerService().registerService(request: self.serviceRequest) { isSuccess in
                            if isSuccess {
                                BookIdData.shared.addId(self.serviceRequest.serviceProviderHeader.bookingId)
                                self.navigationController?.pushViewController(OverviewViewController(), animated: true)
                            }
                        }
                    } else {
                        return
                    }
                }
            }
            return
        }
        index += 1
        if index > maxIndex {
            maxIndex = index
        }
        let newVC = elements[index].createViewController()
        newVC.elementsView?.delegate = self
        if index == elements.count - 1 {
            newVC.nextButtonTitle = "Отправить"
        }
        DispatchQueue.global(qos: .utility).async {
            ServerService().postRequest(request: self.serviceRequest) { _ in
                
            }
        }
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func popViewTapped() {
        if index > 0 {
           index -= 1
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func toRoot() {
        navigationController?.popToViewController(self, animated: true)
        self.collectionView.reloadData()
    }
}
