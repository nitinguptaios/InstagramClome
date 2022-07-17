//
//  SuggestionCollectionViewCell.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 02/05/22.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    //MARK: - identifier
    static let identifier = "SuggestionCollectionViewCell"
    
    //MARK: - functions
    let profileImage = Element.shared.circularImageView(image: UIImage(named: Image.profilePic)!)
    let profileName = Element.shared.label(title: .profileName, size: 16, weight: .regular)
    let follower = Element.shared.label(title: .profileName, size: 14, weight: .medium)
    let crossBtn = Element.shared.buttonWithoutBorder(title: .blank,image: UIImage(systemName: Image.crossImg), imageTint: .label)
   // let stackView = Element.shared.stackView()
    let followBtn = Element.shared.button(title: .follow,backgroundColor: .link)
    
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
        crossBtn.frame = CGRect(x: contentView.width - 20, y: 3, width: 15, height: 15)
        profileImage.frame = CGRect(x: (contentView.width - 90) / 2, y: crossBtn.bottom + 5, width: 90, height: 90)
        profileImage.layer.cornerRadius = profileImage.width / 2
        profileName.frame = CGRect(x: 20, y: profileImage.bottom, width: contentView.width - 40, height: 25)
        follower.frame = CGRect(x:  (contentView.width - 160) / 2, y: profileName.bottom , width: 160, height: 45)
        follower.numberOfLines = 0
        followBtn.frame =  CGRect(x: 20, y: follower.bottom + 10, width: contentView.width - 40, height: 35)
        //stackView.frame = CGRect(x: 40, y: 10, width: contentView.width - 80, height: contentView.height - 70)
    }
    
    func addSubViews() {
        contentView.addSubview(crossBtn)
//        contentView.addSubview(stackView)
        contentView.addSubview(followBtn)
//        stackView.addArrangedSubview(profileImage)
//        stackView.addArrangedSubview(profileName)
//        stackView.addArrangedSubview(followedBy)
//        stackView.addArrangedSubview(follower)
        contentView.addSubview(profileImage)
        contentView.addSubview(profileName)
        contentView.addSubview(follower)
    }
    
    func configureData(with model: Suggestion){
        profileImage.image = UIImage(named: "\(model.profileImage)")
        profileName.text = model.profileName
        follower.text = getFollowersText(followerArray: model.followedBy)
    }
    
    func getFollowersText(followerArray: [String]) -> String{
        if followerArray.count > 1 {
            let text = "Followed by \(followerArray[0]) + \(followerArray.count - 1) more"
            return text
        }
        return "Followed by \(followerArray[0])"
    }
}
