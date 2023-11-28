//
//  ProfileViewController.swift
//  MoviesAppColaboration
//
//  Created by Nana Jimsheleishvili on 28.11.23.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - UI Components
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = .zero
        return label
    }()
    
    private var viewModel: ProfileViewModel = DefaultProfileViewModel()
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        addSubview()
        setupConstraints()
        setupViewModelDelegate()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func addSubview() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileImageView)
        mainStackView.addArrangedSubview(nameLabel)
        mainStackView.addArrangedSubview(surnameLabel)
        mainStackView.addArrangedSubview(bioLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

// MARK: - MovieDetailsViewModelDelegate
extension ProfileViewController: ProfileViewModelDelegate {
    func profileDetailsFetched(_ details: ProfileDetails) {
        DispatchQueue.main.async {
            self.profileImageView.image = UIImage()
            self.nameLabel.text = details.firstName
            self.surnameLabel.text = details.lastName
            self.bioLabel.text = details.bio
        }
    }
    
    func showError(_ error: Error) {
        print("Error")
    }
}

