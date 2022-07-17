//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 29/04/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    var feedArray:[FeedModel] = [FeedModel]()
    
    private let instagramLogo = Element.shared.imageView(image: UIImage(named: Image.logo)!, tintColor: .white, borderColor: .clear)
    private let plusBtn = Element.shared.buttonWithoutBorder(title: .blank, image: UIImage(systemName: "plus.square")!, imageTint: .label)
    private let chatBtn = Element.shared.buttonWithoutBorder(title: .blank, image: UIImage(systemName: "paperplane")!, imageTint: .label)
    
    private let feedCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize(width: 120, height: 130)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - LifeCycle Func
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .clear
        checkUserAuthentication()
        addSubviews()
        getSuggestionData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //frames
        instagramLogo.frame = CGRect(x: 10, y: 40, width: 200, height: 50)
        plusBtn.frame = CGRect(x: view.width - 140, y: 40, width: 50, height: 50)
        chatBtn.frame = CGRect(x: view.width - 70, y: 40, width: 50, height: 50)
        feedCollectionView.frame = CGRect(x: 0, y: instagramLogo.bottom + 10, width: view.width, height: 160)
    }
    
    //MARK: - functions
    
    func addTargets() {
        plusBtn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
        chatBtn.addTarget(self, action: #selector(chatBtnTapped), for: .touchUpInside)
    }
    
    @objc func addBtnTapped() {
        print("add btn tapped")
    }
    
    @objc func chatBtnTapped() {
        print("chat btn tapped")
    }
    
    //func to check if user is login or not
    func checkUserAuthentication() {
        if Auth.auth().currentUser == nil{
            //user is not login show Login Page
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    func addSubviews() {
        view.addSubview(instagramLogo)
        view.addSubview(chatBtn)
        view.addSubview(plusBtn)
        view.addSubview(feedCollectionView)
    }
    
    func getSuggestionData() {
        feedArray.append(FeedModel(profileImage: "image1", profileName: "demoProfile1"))
        feedArray.append(FeedModel(profileImage: "image2", profileName: "demoProfile2"))
        feedArray.append(FeedModel(profileImage: "image3", profileName: "demoProfile3"))
        feedArray.append(FeedModel(profileImage: "image4", profileName: "demoProfile4"))
        feedArray.append(FeedModel(profileImage: "image5", profileName: "demoProfile5"))
        feedArray.append(FeedModel(profileImage: "image6", profileName: "demoProfile6"))
        feedArray.append(FeedModel(profileImage: "image1", profileName: "demoProfile1"))
        feedArray.append(FeedModel(profileImage: "image2", profileName: "demoProfile2"))
        feedArray.append(FeedModel(profileImage: "image3", profileName: "demoProfile3"))
        feedArray.append(FeedModel(profileImage: "image4", profileName: "demoProfile4"))
        feedArray.append(FeedModel(profileImage: "image5", profileName: "demoProfile5"))
        feedArray.append(FeedModel(profileImage: "image6", profileName: "demoProfile6"))
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        cell.configureData(with: feedArray[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
