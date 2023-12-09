//
//  ViewController.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 07/12/23.
//

import UIKit



class MessageListViewController: UIViewController {
    
    let messageData: [MessageListModel] = [
        MessageListModel(userName: "Grant Ward", lastMessage: "Hi how are you! I've tried to call you but you haven't respond", userImage: "prof-img1", date: "10/08/2020", pending: true, pendingCount: "4"),
        MessageListModel(userName: "Jack Dorsey", lastMessage: "Hello! Could you tell me how to achieve this in swiftUI", userImage: "prof-img2", date: "13/08/2020", pending: false, pendingCount: "0"),
        MessageListModel(userName: "Dheeraj", lastMessage: "Good morning.", userImage: "prof-img3", date: "11/08/2020", pending: true, pendingCount: "7"),
        MessageListModel(userName: "Daisy Johnson", lastMessage: "See you soon!", userImage: "prof-img4", date: "15/08/2020", pending: false, pendingCount: "0"),
        MessageListModel(userName: "Philip Coulson", lastMessage: "Amazing I loved it ❤️.", userImage: "prof-img5", date: "10/08/2020", pending: false, pendingCount: "0"),
        MessageListModel(userName: "John Garrett", lastMessage: "Good luck son.", userImage: "prof-img6", date: "19/08/2020", pending: false, pendingCount: "0"),
        MessageListModel(userName: "Dheeraj Kumar Sharma", lastMessage: "This is test!", userImage: "prof-img7", date: "20/08/2020", pending: false, pendingCount: "0"),
    ]
    
    let navView: MessageListNavigationView = {
        let v = MessageListNavigationView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(MessageListCollectionViewCell.self, forCellWithReuseIdentifier: "MessageListCollectionViewCell")
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.delaysContentTouches = false
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = CustomColor.appLight
        view.addSubview(navView)
        view.addSubview(collectionView)
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            navView.topAnchor.constraint(equalTo: view.topAnchor),
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navView.heightAnchor.constraint(equalToConstant: 140),
            
            collectionView.topAnchor.constraint(equalTo: navView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MessageListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessageListCollectionViewCell", for: indexPath) as! MessageListCollectionViewCell
        cell.data = messageData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut , animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! MessageListCollectionViewCell
            cell.contentView.backgroundColor = UIColor(white: 0, alpha: 0.1)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! MessageListCollectionViewCell
            cell.contentView.backgroundColor = .clear
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
 
