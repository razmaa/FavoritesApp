//
//  AddNewItemToListViewController.swift
//  FavSongsApp
//
//  Created by nika razmadze on 29.10.23.
//

import UIKit

class AddNewItemToListViewController: UIViewController {
    
    // MARK: - Elements
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        return stackView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let name: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.layer.cornerRadius = 16
        textField.clipsToBounds = true
        textField.placeholder = "Enter name of a song"
        textField.backgroundColor = .white
        return textField
    }()
    
    private let artist: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 16
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.clipsToBounds = true
        textField.placeholder = "Enter name of a artist"
        textField.backgroundColor = .white
        return textField
    }()
    
    private var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload Image", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(uploadImageButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save music", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveImageButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var delegate: MusicEntryDelegate?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpStackView()
    }
    
    //MARK: - Methods
    private func setUpStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(artist)
        stackView.addArrangedSubview(uploadButton)
        stackView.addArrangedSubview(saveButton)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 9.0/16.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
    }
    
    @objc func uploadImageButtonTapped() {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
        if let name = name.text, !name.isEmpty, let artist = artist.text, !artist.isEmpty{
            if let image = imageView.image{
                delegate?.didEnterMusic(name: name, artist: artist, image: image)
            }
        } else {
            name.backgroundColor = .red
            artist.backgroundColor = .red
        }
        
    }
    
    @objc func saveImageButtonTapped() {
        
        if let name = name.text, !name.isEmpty, let artist = artist.text, !artist.isEmpty, let image = imageView.image{
            delegate?.didEnterMusic(name: name, artist: artist, image: image)
            navigationController?.popViewController(animated: true)
        } else {
            name.backgroundColor = .red
            artist.backgroundColor = .red
        }
        
    }
    
}

// MARK: - Image Picker Delegate
extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}




