//
//  TextView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class TextView: UIView {
    let textLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        textLabel.textColor = UIColor.black
        textLabel.font = UIFont.systemFont(ofSize: 16)
        textLabel.frame = frame
        addSubview(textLabel)
    }
}
