//
//  HomeCV.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import UIKit

class HomeCV: UIViewController {
    
    // MARK: - Properties
    private let moviesTableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var movies = [Movie]()
    private let viewModel = HomeViewModel()

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = UIColor(red: 26/255.0, green: 34/255.0, blue: 50/255.0, alpha: 1)
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        moviesTableView.register(UINib(nibName: "MovieItemCell", bundle: nil), forCellReuseIdentifier: "MovieItemCell")
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    func setupViewModel() {
        viewModel.delegate = self
    }
}

// MARK: - tableView DataSource
extension HomeCV: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieItemCell", for: indexPath) as? MovieItemCell
        cell?.configure(with: movies[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - HomeViewModelDelegate
extension HomeCV: HomeViewModelDelegate {
    
    func moviesFetched(_ movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
