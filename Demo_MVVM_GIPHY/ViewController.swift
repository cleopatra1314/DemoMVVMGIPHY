//
//  ViewController.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import UIKit
import SnapKit

let fullSize = UIScreen.main.bounds.size

class ViewController: UIViewController {
    
    private let vm = GipViewModel()
    
//    fileprivate let fullSize = UIScreen.main.bounds.size
    
    private lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: fullSize.width, height: 600)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        homeCollectionView.collectionViewLayout = UICollectionViewLayout()
        cv.backgroundColor = .lightGray
        cv.dataSource = self
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        vm.getGip()
        vm.delegate = self
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
        print("✨\(vm.gipData.count)")
        return vm.gipData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        let item = vm.gipData[indexPath.item]
        cell.item = item
        return cell
    }
}

extension ViewController: GipViewModelDelegate {
    func didFinish() {
        self.homeCollectionView.reloadData()
    }
    
    func didFailure() {
        
    }
    
    
}
