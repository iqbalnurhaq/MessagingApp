//
//  CustomMessageView.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 08/12/23.
//

import UIKit

class CustomImageView: UIView {
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "prof-img4")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    let indicatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2.5
        v.layer.cornerRadius = 7.5
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(indicatorView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            indicatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            indicatorView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            indicatorView.widthAnchor.constraint(equalToConstant: 15),
            indicatorView.heightAnchor.constraint(equalToConstant: 15)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    

}
