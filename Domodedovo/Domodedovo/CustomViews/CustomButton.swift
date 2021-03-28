//
//  CustomButton.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class CustomButton: UIButton {
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var rightImage: UIImage? {
        didSet {
            rightImage = rightImage?.withRenderingMode(.alwaysTemplate)
            setUpRightImage()
        }
    }
    
    private func setUp() {
        layer.cornerRadius = 8
        layer.borderColor = UIColor(named: "Main")?.cgColor
        layer.borderWidth = 2
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.leadingAnchor.constraint(equalTo: imageView?.trailingAnchor ?? leadingAnchor, constant: 18).isActive = true
    }
    
    private func setUpRightImage() {
        let rightImageView = UIImageView(image: rightImage)
        
        let height = self.frame.height * 0.2
        let width = height
        let xPos = self.frame.width - 2 * width
        let yPos = (self.frame.height - height) / 2

        rightImageView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        rightImageView.tintColor = .gray
        self.addSubview(rightImageView)
    }
    
    var borderColor: CGColor? {
        get {
            layer.borderColor
        }
        set {
            layer.borderColor = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    var imageLeftPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.left = imageLeftPadding
        }
    }
    var imageRightPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.right = imageRightPadding
        }
    }
    var imageTopPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.top = imageTopPadding
        }
    }
    var imageBottomPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.bottom = imageBottomPadding
        }
    }
}
