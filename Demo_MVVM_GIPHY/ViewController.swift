//
//  ViewController.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var homeCollectionView: UICollectionView = {
        let homeCollectionView = UICollectionView()
        homeCollectionView.collectionViewLayout = UICollectionViewLayout()
        homeCollectionView.backgroundColor = .blue
        
        return homeCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }

    private func setUp() {
        view.addSubview(homeCollectionView)
        
        homeCollectionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view)
        }
    }

}

