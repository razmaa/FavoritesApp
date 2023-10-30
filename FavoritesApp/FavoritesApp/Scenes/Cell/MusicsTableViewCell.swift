//
//  MusicsTableViewCell.swift
//  FavSongsApp
//
//  Created by nika razmadze on 29.10.23.
//

import UIKit

class MusicsTableViewCell: UITableViewCell {
    
    // MARK: - Elements
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setUpViews()
        setUpCells()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        artistLabel.text = nil
        musicImageView.image = nil
    }
    
    // MARK: - Configure
    func configure(with model: Music) {
        nameLabel.text = model.name
        artistLabel.text = model.artist
        musicImageView.image = model.image
    }
    
    
    // MARK: - Methods
    private func setUpViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(musicImageView)
        stackView.addArrangedSubview(artistLabel)
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func setUpCells() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            musicImageView.widthAnchor.constraint(equalToConstant: 60),
            musicImageView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
