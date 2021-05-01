//
//  DoubleColumnLayout.swift
//  NewsPaper
//
//  Created by RodaDev on 24.04.2021.
//

import UIKit

protocol DoubleColumnLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, width: CGFloat) -> CGFloat
    func collectionView(_ collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, width: CGFloat) -> CGFloat
}

class DoubleColumnLayout: UICollectionViewLayout {
    
    var numberOfColumns: CGFloat = 2
    var cellPadding: CGFloat = 5
    
    weak var delegate: DoubleColumnLayoutDelegate?
    
    private var contentHeight: CGFloat = 0
    private lazy var contentWidth = getContentWidth()
    
    private var attributesCache = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        guard let collectionView = collectionView else {
            super.prepare()
            return
        }
        if attributesCache.isEmpty {
            let columnWidth = contentWidth / numberOfColumns
            
            var xOffsets = [CGFloat]()
            for columnIndex in 0 ..< Int(numberOfColumns) {
                let currentWidth = CGFloat(columnIndex) * columnWidth
                xOffsets.append(currentWidth)
            }
            var columnIndex = 0
            var yOffsets = [CGFloat](repeating: 0, count: Int(numberOfColumns))
            
            for itemIndex in 0..<collectionView.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: itemIndex, section: 0)
                
                //TODO: - Вообще тут не понял
                let width: CGFloat = columnWidth - cellPadding * 2
                
                let photoHeight = delegate?.collectionView(collectionView, heightForPhotoAt: indexPath, width: width) ?? 0
                
                let captionHeight = delegate?.collectionView(collectionView, heightForCaptionAt: indexPath, width: width) ?? 0
                let height: CGFloat = photoHeight + captionHeight + cellPadding * 2
                
                let frame = CGRect(x: xOffsets[columnIndex], y: yOffsets[columnIndex],
                                   width: width, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesCache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                
                yOffsets[columnIndex] = yOffsets[columnIndex] + height
                columnIndex = CGFloat(columnIndex) >= (numberOfColumns - 1) ? 0 : columnIndex + 1
                
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        attributesCache.forEach {
            if $0.frame.intersects(rect) {
                layoutAttributes.append($0)
            }
        }
        return layoutAttributes
    }
    
    private func getContentWidth() -> CGFloat {
        guard let contentInsets = collectionView?.contentInset,
              let width = collectionView?.bounds.width else {
            return 0
        }
        return width - (contentInsets.left + contentInsets.right)
    }

}
