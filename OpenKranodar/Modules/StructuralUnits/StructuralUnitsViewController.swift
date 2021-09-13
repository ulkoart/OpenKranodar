//
//  StructuralUnitsViewController.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import UIKit

protocol StructuralUnitsViewControllerProtocol: AnyObject {
    func showloadingView()
}

class StructuralUnitsViewController: UIViewController {
    
    var presenter: StructuralUnitsPresenterProtocol?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.8, alpha: 1)
        view.layer.cornerRadius = 8.0
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -4).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        let loadMsg = UILabel()
        loadMsg.translatesAutoresizingMaskIntoConstraints = false
        loadMsg.font = .init(.systemFont(ofSize: 14, weight: .thin))
        loadMsg.text = "Загрузка..."
        
        view.addSubview(loadMsg)
        loadMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadMsg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.alpha = 0
        showloadingView()
        presenter?.fetchStructuralUnits()
    }
    
    private func setupUI() {
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .white
        navigationItem.title = "Подразделения"
        self.navigationController?.navigationBar.barTintColor = .init("083757")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // MARK: - loadingView
         view.addSubview(loadingView)
         loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         loadingView.widthAnchor.constraint(equalTo: loadingView.heightAnchor).isActive = true
        
        // MARK: - tableView
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension StructuralUnitsViewController: StructuralUnitsViewControllerProtocol {
    func showloadingView() {
        loadingView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingView.alpha = 1
        })
    }
}
