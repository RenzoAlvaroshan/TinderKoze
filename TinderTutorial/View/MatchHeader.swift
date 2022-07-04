//
//  MatchHeader.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 22/06/22.
//

import UIKit

private let cellIdentifier = "MatchCell"

protocol MatchHeaderDelegate: AnyObject {
    func matchHeader(_ header: MatchHeader, wantsToStartChatWith uid: String)
}

class MatchHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    weak var delegate: MatchHeaderDelegate?
    
    var matches = [Match]() {
        didSet { collectionView.reloadData() }
    }
    
    private lazy var newMathcesLabel: UILabel = {
        let label = UILabel()
        label.text = "New Matches"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.9826375842, green: 0.3476698399, blue: 0.447683692, alpha: 1)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(MatchCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return cv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(newMathcesLabel)
        newMathcesLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        addSubview(collectionView)
        collectionView.anchor(top: newMathcesLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor,
                              right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 24 ,paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDataSource

extension MatchHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        matches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MatchCell
        cell.viewModel = MatchCellViewModel(match: matches[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MatchHeader: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let uid = matches[indexPath.row].uid
        delegate?.matchHeader(self, wantsToStartChatWith: uid)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MatchHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 124)
    }
}
