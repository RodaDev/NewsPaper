//
//  NewsFeedCell.swift
//  NewsPaper
//
//  Created by RodaDev on 07.04.2021.
//

import UIKit
import SnapKit

class NewsFeedCell: UITableViewCell {
    
    private var itemImageView: UIImageView!
    private var titleLabel: UILabel!
    private var channelLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurateUI() {
        configTitleLabel()
    }
    
    private func configTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
    }
}
