//
//  CustomUI.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textAlignment = .left
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomLabelTitle: CustomLabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        font = .boldSystemFont(ofSize: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomLabelNormalBig: CustomLabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        font = .systemFont(ofSize: 14)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomLabelNormalSmallCenter: CustomLabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        textAlignment = .center
        font = .systemFont(ofSize: 11)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomLabelNormalSmallLeft: CustomLabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        font = .systemFont(ofSize: 11)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomLabelText: CustomLabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        textAlignment = .right
        textColor = .lightGray
        font = .italicSystemFont(ofSize: 11)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomImageView: UIImageView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 10.0
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.5

        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CustomHorizontalStackView: UIStackView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false

        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
        spacing = 10
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
