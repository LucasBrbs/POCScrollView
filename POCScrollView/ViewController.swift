//
//  ViewController.swift
//  POCScrollView
//
//  Created by Lucas Barbosa de Oliveira on 22/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    func scrollToItem(
        at indexPath: IndexPath,
        at scrollPosition: UICollectionView.ScrollPosition,
        animated:Bool
    ){}
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.view.addSubview(self.collectionView)
        
        self.configConstraints()
        //scrollToItem(at: , at: UICollectionView.ScrollPosition.top, animated: true)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate{
    
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.scrollToItem(at: IndexPath(row: 10, section: 0), at: .bottom, animated: true)
        
        if (indexPath.row % 2 == 0){
            collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
        else {
            collectionView.register(CustomCollection2ViewCell.self, forCellWithReuseIdentifier: CustomCollection2ViewCell.identifier)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollection2ViewCell.identifier, for: indexPath) as? CustomCollection2ViewCell
            return cell ?? UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
        }
    
    

}
