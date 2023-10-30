//
//  ViewController.swift
//  FavSongsApp
//
//  Created by nika razmadze on 29.10.23.
//

import UIKit

protocol MusicEntryDelegate {
    func didEnterMusic(name: String, artist: String, image: UIImage)
}

class ViewController: UIViewController {
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableview()
        
        
    }
    
    //MARK: - Properties
    private var tableView: UITableView!
    private var plusButton = UIBarButtonItem()
    private var musics = Music.musics
    
    private func setUpNavigationBar() {
        self.title = "Favorites Playlist"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
        plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        self.navigationItem.rightBarButtonItem = plusButton
        
    }
    
    private func setUpTableview() {
        initTableView()
        setUpConstraints()
        registerCells()
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
    }
    
    private func registerCells() {
        tableView.register(MusicsTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setUpConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func plusButtonTapped() {
        let addItemVC = AddNewItemToListViewController()
        addItemVC.delegate = self
        navigationController?.pushViewController(addItemVC, animated: true)
    }
    
}

// MARK: - TableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        if let musicCell = cell as? MusicsTableViewCell {
            musicCell.configure(with: music)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let musicToDelete = musics[indexPath.row]
            if let index = musics.firstIndex(where: { $0 === musicToDelete }) {
                musics.remove(at: index)
            }
        }
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TODO: ვცდილობდი გადაადგილების ფუნქციონალის დამატებას და არ გამომივიდა, თუ გაქვს დრო მიმითითე რა მეშლება, მადლობა <3
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = musics.remove(at: sourceIndexPath.row)
        musics.insert(movedItem, at: destinationIndexPath.row)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: - TableVIew Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favoriteMusicVc = FavoriteMusicVC()
        favoriteMusicVc.music = musics[indexPath.row]
        navigationController?.pushViewController(favoriteMusicVc, animated: true)
    }
}


// MARK: - Music Entry Delegate
extension ViewController: MusicEntryDelegate {
    
    func didEnterMusic(name: String, artist: String, image: UIImage) {
        musics.insert(Music(name: name, artist: artist, image: image), at: 0)
        tableView.reloadData()
    }
}



