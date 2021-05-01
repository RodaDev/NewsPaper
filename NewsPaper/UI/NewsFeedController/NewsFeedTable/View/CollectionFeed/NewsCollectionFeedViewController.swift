//
//  NewsCollectionFeedViewController.swift
//  NewsPaper
//
//  Created by RodaDev on 25.04.2021.
//

import UIKit
import SnapKit
import AVKit

class NewsCollectionFeedViewController: UIViewController {
    
    lazy var collectionView = getCollectionView()
    var presenter: NewsFeedPresenterProtocol!
    var collectionLayout = DoubleColumnLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        presenter.viewDidLoad()
    }
    
    private func getCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        collectionLayout.delegate = self
        collectionView.register(NewsCollectionFeedCell.self,
                                forCellWithReuseIdentifier: NewsCollectionFeedCell.identifier)
        return collectionView
    }
    
}

extension NewsCollectionFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumbersOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.getItem(for: indexPath),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionFeedCell.identifier, for: indexPath) as? NewsCollectionFeedCell else {
            return UICollectionViewCell()
        }
        cell.setImage(item.image)
        cell.setTitle(item.title)
        //cell.setDescription(item.descript)
        
        return cell
    }
}

extension NewsCollectionFeedViewController: UICollectionViewDelegate {
    
}

extension NewsCollectionFeedViewController: NewsFeedViewProtocol {
    func reload() {
        collectionView.reloadData()
    }
}

extension NewsCollectionFeedViewController: DoubleColumnLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, width: CGFloat) -> CGFloat {
        
        let item = presenter.getItem(for: indexPath)
        guard let image = item?.image else {
            return 0
        }
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return rect.height
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, width: CGFloat) -> CGFloat {
        
        var height: CGFloat = 0
        let padding: CGFloat = 8
        
        guard let item = presenter.getItem(for: indexPath) else {
            return 0
        }
        if let title = item.title {
            height += getHeight(for: title, font: UIFont.boldSystemFont(ofSize: 18), width: width)
            height += padding
        }
        if let description = item.descript {
            height += getHeight(for: description, font: UIFont.italicSystemFont(ofSize: 14), width: width)
            height += padding
        }
        return height
    }
    
    private func getHeight(for text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = text as NSString
        let maxHeight = CGFloat(100000)
        let textAttributes = [NSAttributedString.Key.font: font]
        let size = CGSize(width: width, height: maxHeight)
        let boundingRect = nsstring.boundingRect(with: size,
                                                 options: .usesLineFragmentOrigin,
                                                 attributes: textAttributes,
                                                 context: nil)
        return ceil(boundingRect.height)
    }
 }
