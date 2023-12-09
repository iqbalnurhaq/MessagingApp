//
//  MessageListNavigationView.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 08/12/23.
//

import UIKit

class MessageListNavigationView: UIView {
    
    let navBackView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 35
        v.layer.maskedCorners = [.layerMaxXMaxYCorner]
        v.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowOpacity = 1
        v.layer.shadowRadius = 10
        return v
    }()
    
    let navBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    let searchBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appLight
        v.layer.cornerRadius = 20
        return v
    }()
    
    
    let searchLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Search"
        l.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        l.textColor = .lightGray
        return l
    }()
    
    let searchBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "search"), for: .normal)
        return btn
    }()

    let stackView: UIStackView = {
       let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.spacing = 10
        return sv
    }()
    
    let btn1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "group"), for: .normal)
        return btn
    }()
    
    let btn2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "star"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(navBackView)
        navBackView.addSubview(navBar)
        navBar.addSubview(searchBar)
        navBar.addSubview(stackView)
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        searchBar.addSubview(searchBtn)
        searchBar.addSubview(searchLabel)
        
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            navBackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBackView.topAnchor.constraint(equalTo: topAnchor),
            navBackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchBar.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -25),
            searchBar.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            searchLabel.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 25),
            searchLabel.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            
            searchBtn.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -25),
            searchBtn.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchBtn.heightAnchor.constraint(equalToConstant: 20),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            
            stackView.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -30),
            stackView.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            stackView.widthAnchor.constraint(equalToConstant: 100)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
