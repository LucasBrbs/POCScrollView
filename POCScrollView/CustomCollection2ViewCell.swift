//
//  CustomCollection2ViewCell.swift
//  POCScrollView
//
//  Created by Lucas Barbosa de Oliveira on 23/11/22.
//

import UIKit

class CustomCollection2ViewCell: UICollectionViewCell {
    static let identifier: String = "CustomCollection2ViewCell"
    
    let imageHeart: UIImageView = {
        let heart: UIImageView = UIImageView(image: UIImage(named: "Rectangle"))
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.contentMode = .scaleToFill
        return heart
    }()
    
    let progress: UIImageView = {
        let progress: UIImageView = UIImageView(image: UIImage(named: "Frame"))
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.contentMode = .scaleToFill
        
        return progress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imageHeart)
        self.contentView.addSubview(self.progress)
        self.backgroundColor = .systemBackground
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.imageHeart.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -50),
            self.imageHeart.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 240),
            self.imageHeart.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageHeart.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.imageHeart.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            self.progress.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.progress.bottomAnchor.constraint(equalTo: self.imageHeart.centerYAnchor,constant: 15),
            
        ])
    }
}
