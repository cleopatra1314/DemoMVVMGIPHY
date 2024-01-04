//
//  ViewController.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let vm = GIPViewModel()
    
    private lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        homeCollectionView.collectionViewLayout = UICollectionViewLayout()
        cv.backgroundColor = .blue
        cv.dataSource = self
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        return cv
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

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.gipData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        let item = vm.gipData[indexPath.item]
        cell.
        return cell
    }
}
