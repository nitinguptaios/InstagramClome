//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 29/04/22.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - outlet
    private let profileView = Element.shared.circularImageView(image: UIImage(named: Image.profilePic)!)
    private let postCount = Element.shared.label(title: .demoCount)
    private let posts = Element.shared.label(title: .posts)
    private let followerCount = Element.shared.label(title: .demoCount)
    private let followers = Element.shared.label(title: .followers)
    private let followingCount = Element.shared.label(title: .demoCount)
    private let following = Element.shared.label(title: .followings)
    
    private var outerStack = Element.shared.stackView(axis: .horizental)
    
    private var innerStack1 = Element.shared.stackView(axis: .vertical, spacing: 5)
    private var innerStack2 = Element.shared.stackView(axis: .vertical, spacing: 5)
    private var innerStack3 = Element.shared.stackView(axis: .vertical, spacing: 5)
    
    private let profileName = Element.shared.label(title: .profileName)
    private let editButton = Element.shared.button(title: .editProfile)
    private let suggestionButton = Element.shared.button(title: .blank, image: UIImage(systemName: Image.system_person))
    private let discoverLabel = Element.shared.label(title: .discoverPeople, size: 18, weight: .bold)
    private let seeAllBtn = Element.shared.buttonWithoutBorder(title: .seeAll,titleColor: .link)

    var suggestionArray: [Suggestion] = [Suggestion]()
    
    private let suggestionCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.estimatedItemSize = CGSize(width: 180, height: 250)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SuggestionCollectionViewCell.self, forCellWithReuseIdentifier: SuggestionCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let gallaryBackView = Element.shared.view(backgroundColor: .red)
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        suggestionCollectionView.delegate = self
        suggestionCollectionView.dataSource = self
        getSuggestionData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //frame
        profileView.frame = CGRect(x: 20, y: 80, width: 120, height: 120)
        profileView.layer.cornerRadius = profileView.frame.size.width / 2
        outerStack.frame = CGRect(x: profileView.trailing + 20, y: 110, width: 250, height: 60)
        profileName.frame = CGRect(x: 10, y: profileView.bottom + 5, width: 150, height: 35)
        editButton.frame = CGRect(x: 20, y: profileName.bottom + 40, width: view.width - 100, height: 45)
        suggestionButton.frame = CGRect(x: editButton.trailing + 10, y: profileName.bottom + 40, width: 50, height: 45)
        discoverLabel.frame = CGRect(x: 20, y: suggestionButton.bottom + 30, width: 150, height: 30)
        seeAllBtn.frame = CGRect(x: view.width - 120, y: suggestionButton.bottom + 30, width: 100, height: 30)
        suggestionCollectionView.frame = CGRect(x: 0, y: discoverLabel.bottom + 10, width: view.bounds.width, height: 250)
        gallaryBackView.frame = CGRect(x: 0, y: suggestionCollectionView.bottom + 20, width:  view.width, height: 40)
    }
    
    
    //MARK: - function
    func addSubviews() {
        view.addSubview(profileView)
        view.addSubview(outerStack)
        outerStack.addArrangedSubview(innerStack1)
        outerStack.addArrangedSubview(innerStack2)
        outerStack.addArrangedSubview(innerStack3)
        innerStack1.addArrangedSubview(postCount)
        innerStack1.addArrangedSubview(posts)
        innerStack2.addArrangedSubview(followerCount)
        innerStack2.addArrangedSubview(followers)
        innerStack3.addArrangedSubview(followingCount)
        innerStack3.addArrangedSubview(following)
        view.addSubview(profileName)
        view.addSubview(editButton)
        view.addSubview(suggestionButton)
        view.addSubview(discoverLabel)
        view.addSubview(seeAllBtn)
        view.addSubview(suggestionCollectionView)
        view.addSubview(gallaryBackView)
    }
    
    func getSuggestionData() {
        suggestionArray.append(Suggestion(profileImage: "image1", profileName: "demoProfile1", followedBy: ["demoProfile2", "demoProfile3"]))
        suggestionArray.append(Suggestion(profileImage: "image2", profileName: "demoProfile2", followedBy: ["demoProfile1", "demoProfile3", "demoProfile4"]))
        suggestionArray.append(Suggestion(profileImage: "image3", profileName: "demoProfile3", followedBy: ["demoProfile2", "demoProfile1", "demoProfile4", "demoProfile6"]))
        suggestionArray.append(Suggestion(profileImage: "image4", profileName: "demoProfile4", followedBy: ["demoProfile5"]))
        suggestionArray.append(Suggestion(profileImage: "image5", profileName: "demoProfile5", followedBy: ["demoProfile1", "demoProfile2", "demoProfile3"]))
        suggestionArray.append(Suggestion(profileImage: "image6", profileName: "demoProfile6", followedBy: ["demoProfile2"]))
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCollectionViewCell.identifier, for: indexPath) as! SuggestionCollectionViewCell
        cell.configureData(with: suggestionArray[indexPath.row])
        cell.backgroundColor = .clear
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    
}
