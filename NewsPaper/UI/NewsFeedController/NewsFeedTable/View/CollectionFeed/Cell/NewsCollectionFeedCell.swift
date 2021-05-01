//
//  NewsCollectionFeedCell.swift
//  NewsPaper
//
//  Created by RodaDev on 25.04.2021.
//

import UIKit
import SnapKit

class NewsCollectionFeedCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionFeedCellIdentifier"
    
    lazy var photoImageView = getPhotoImageView()
    lazy var titleLabel = getTitleLabel()
    lazy var descriptionLabel = getDescriptionLabel()
    
    private let stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage?) {
        guard let image = image else {
            return
        }
        photoImageView.image = image
        stack.addArrangedSubview(photoImageView)
    }
    
    func setTitle(_ title: String?) {
        guard let title = title else {
            return
        }
        titleLabel.text = title
        stack.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview().offset(-4)
        }
    }
    
    func setDescription(_ description: String?) {
        guard let description = description else {
            return
        }
        descriptionLabel.text = description
        stack.addArrangedSubview(descriptionLabel)
    }
    
    private func createUI() {
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .clear
        addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stack.spacing = 8
        stack.axis = .vertical
        stack.clipsToBounds = true
        contentView.addSubview(stack)
        let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 8, right: 0)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(insets)
            $0.width.equalToSuperview()
        }
    }
    
    private func getPhotoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }
    
    private func getTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        //label.alignmentRectInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        return label
    }
    
    private func getDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 14)
        return label
    }
    
}
