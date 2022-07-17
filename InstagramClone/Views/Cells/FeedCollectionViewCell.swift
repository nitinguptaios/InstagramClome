//
//  FeedCollectionViewCell.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 03/05/22.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "FeedCollectionViewCell"
    
    private let profileView = Element.shared.circularImageView(image: UIImage(named: Image.profilePic)!)
    private let profileName = Element.shared.label(title: .profileName,size: 14,weight: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //frame
        profileView.frame = CGRect(x: (contentView.width - 100) / 2, y: 0, width: 100, height: 100)
        profileView.layer.cornerRadius = profileView.width / 2
        profileName.frame = CGRect(x: 10, y: profileView.bottom + 5, width: contentView.width - 20, height: 20)
    }
    
    func addSubViews() {
        contentView.addSubview(profileView)
        contentView.addSubview(profileName)
    }
    
    func configureData(with model: FeedModel){
        profileView.image = UIImage(named: "\(model.profileImage)")
        profileName.text = model.profileName
//
    }
    
}
