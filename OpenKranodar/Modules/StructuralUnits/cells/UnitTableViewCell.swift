//
//  UnitTableViewCell.swift
//  OpenKranodar
//
//  Created by user on 17.09.2021.
//

import UIKit

class UnitTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "unitTableViewCell"
    
    let titileLabel:UILabel = {
        let label = UILabel()
        label.font = .init(.systemFont(ofSize: 14, weight: .semibold))
        label.textColor =  .deepBlue
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subdivisionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "krd"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.deepBlue.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ subdivision: Subdivision) {
        titileLabel.text = subdivision.title
    }
    
    private func setupUI() {
        self.addSubview(subdivisionImageView)
        subdivisionImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        subdivisionImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subdivisionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        subdivisionImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        self.addSubview(titileLabel)
        titileLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titileLabel.leadingAnchor.constraint(equalTo: subdivisionImageView.trailingAnchor, constant: 8).isActive = true
        titileLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        titileLabel.centerYAnchor.constraint(equalTo: subdivisionImageView.centerYAnchor).isActive = true
        
    }
}
