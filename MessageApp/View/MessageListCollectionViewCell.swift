//
//  MessageListCollectionViewCell.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 08/12/23.
//

import UIKit

class MessageListCollectionViewCell: UICollectionViewCell {
    
    
    var data: MessageListModel? {
        didSet {
            managedData()
        }
    }
    
    let customImageView: CustomImageView = {
       let v = CustomImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let userName: UILabel = {
       let l  = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 2
        l.text = "Jacson Impl"
        return l
    }()
    
    let dateaLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "10/03/2020"
        l.font = UIFont(name: CustomFont.poppinsMedium, size: 13)
        l.textColor = .lightGray
        return l
    }()
    
    let pendingMessageView: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appPink
        v.layer.cornerRadius = 8
        return v
    }()
    
    let pendingLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "4"
        l.font = UIFont(name: CustomFont.poppinsSemiBold, size: 14)
        l.textColor = .white
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customImageView)
        addSubview(userName)
        addSubview(dateaLabel)
        addSubview(pendingMessageView)
        pendingMessageView.addSubview(pendingLabel)
        setUpConstraints()
    }
    
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            customImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 55),
            customImageView.heightAnchor.constraint(equalToConstant: 55),
            
            userName.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20),
            userName.centerYAnchor.constraint(equalTo: centerYAnchor),
            userName.trailingAnchor.constraint(equalTo: pendingMessageView.leadingAnchor, constant: -10),
            
            dateaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            dateaLabel.bottomAnchor.constraint(equalTo: pendingMessageView.topAnchor, constant: -5),
            
            pendingMessageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            pendingMessageView.heightAnchor.constraint(equalToConstant: 20),
            pendingMessageView.widthAnchor.constraint(equalToConstant: 26),
            pendingMessageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            pendingLabel.centerYAnchor.constraint(equalTo: pendingMessageView.centerYAnchor),
            pendingLabel.centerXAnchor.constraint(equalTo: pendingMessageView.centerXAnchor),
            
            
        ])
    }
    
    func managedData() {
        guard let data = data else { return }
        customImageView.imageView.image = UIImage(named: data.userImage)
        setUserNameAttributedText()
        dateaLabel.text = data.date
        if data.pending {
            pendingMessageView.isHidden = false
            pendingLabel.text = data.pendingCount
        } else {
            pendingMessageView.isHidden = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUserNameAttributedText() {
        guard let data = data else { return }
        let attributedText = NSMutableAttributedString(string: "\(data.userName ?? "")", attributes: [NSAttributedString.Key.font: UIFont(name: CustomFont.poppinsMedium, size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        attributedText.append(NSAttributedString(string: "\n\(data.lastMessage ?? "")", attributes: [NSAttributedString.Key.font: UIFont(name: CustomFont.poppinsMedium, size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        userName.attributedText = attributedText
    }
    
    
}
