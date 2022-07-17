//
//  CreateElemets.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import UIKit

class Element {
    
    //MARK: - shared variable
    static let shared = Element()
    
    func textField(placeHolder: Placeholder, returnType: UIReturnKeyType = .next, isSecureField: Bool = false) -> UITextField {
        let textField:UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder
             = NSAttributedString(string: placeHolder.rawValue,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            textField.returnKeyType = returnType
            textField.leftViewMode = .always
            textField.isSecureTextEntry = isSecureField
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            textField.autocapitalizationType = .none
            textField.layer.masksToBounds = true
            textField.textColor = UIColor.white
            textField.layer.cornerRadius = AppConstanst.cornerRadius
            textField.layer.borderWidth = AppConstanst.borderWidth
            textField.layer.borderColor = AppConstanst.borderColor
            return textField
        }()
        return textField
    }
    
    func button(title: buttonTitle, titleColor: UIColor = Color.buttonTitleColor, backgroundColor: UIColor = Color.buttonBackgroundColor, cornerRadius:CGFloat = AppConstanst.cornerRadius, image:UIImage? = nil) -> UIButton {
        let loginButton: UIButton = {
            let button = UIButton()
            button.setTitle(title.rawValue, for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = cornerRadius
            button.backgroundColor = backgroundColor
            if image != nil {
                button.setImage(image, for: .normal)
            }
            button.setTitleColor(titleColor, for: .normal)
            return button
        }()
        return loginButton
    }
    
    func buttonWithoutBorder(title: buttonTitle,titleColor: UIColor = Color.buttonTitleColor, image:UIImage? = nil, imageTint: UIColor = .link) -> UIButton {
        let loginButton: UIButton = {
            let button = UIButton()
            button.setTitle(title.rawValue, for: .normal)
            button.layer.masksToBounds = true
            button.tintColor = imageTint
            if image != nil {
                button.setImage(image, for: .normal)
            }
            button.setTitleColor(titleColor, for: .normal)
            return button
        }()
        return loginButton
    }
    
    func label(title:labelTitle, size:CGFloat = AppConstanst.Font.descriptionFont, weight: UIFont.Weight = .regular) -> UILabel{
        let label:UILabel = {
            let label = UILabel()
            label.text = title.rawValue
            label.textColor = UIColor.label
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: size, weight: weight)
            return label
        }()
        return label
    }
    
    func circularImageView(image:UIImage) -> UIImageView{
        let imageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.systemTeal.cgColor
            return imageView
        }()
        return imageView
    }
    
    func imageView(image:UIImage, tintColor: UIColor? = nil, borderColor:UIColor = .label, borderWidth:CGFloat = 1.0) -> UIImageView{
        let imageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = borderWidth
            if let tintColor = tintColor {
                imageView.image?.withTintColor(tintColor)
            }
            imageView.layer.cornerRadius = 10
            imageView.layer.borderColor = borderColor.cgColor
            return imageView
        }()
        return imageView
    }
    
    func stackView(axis:Axis = .vertical, distribution: StackViewDistribution = .equalSpacing, alignment: StackViewAlignment = .center, spacing: CGFloat = 0) -> UIStackView{
        let stackView = UIStackView()
        
        switch axis {
        case .horizental:
            stackView.axis = NSLayoutConstraint.Axis.horizontal
        case .vertical:
            stackView.axis = NSLayoutConstraint.Axis.vertical
        }
        
        switch distribution {
        case .fill:
            stackView.distribution = UIStackView.Distribution.fill
        case .fillEqually:
            stackView.distribution = UIStackView.Distribution.fillEqually
        case .fillProportionlly:
            stackView.distribution = UIStackView.Distribution.fillProportionally
        case .equalSpacing:
            stackView.distribution = UIStackView.Distribution.equalSpacing
        case .equalCentering:
            stackView.distribution = UIStackView.Distribution.equalCentering
        }
        
        switch alignment {
        case .top:
            stackView.alignment = UIStackView.Alignment.top
        case .center:
            stackView.alignment = UIStackView.Alignment.center
        case .bottom:
            stackView.alignment = UIStackView.Alignment.bottom
        }

        stackView.spacing = spacing
        return stackView
    }
    
    func view(backgroundColor: UIColor = .clear) -> UIView{
        let view:UIView = {
            let view = UIView()
            view.backgroundColor = backgroundColor
            return view
        }()
        return view
    }
}
