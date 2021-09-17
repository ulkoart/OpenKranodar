//
//  StructuralUnitsViewController.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import UIKit

protocol StructuralUnitsViewControllerProtocol: AnyObject {
    func showLoadingView() -> Void
    func hideLoadingView() -> Void
    func showStructuralUnits(_ structuralUnits: [Subdivision]) -> Void
}

class StructuralUnitsViewController: UIViewController {
    
    var presenter: StructuralUnitsPresenterProtocol?
    var structuralUnits: [Subdivision] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // or .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UnitTableViewCell.self, forCellReuseIdentifier: UnitTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    private let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.6, alpha: 1)
        view.layer.cornerRadius = 8.0
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = .init(white: 1, alpha: 1)
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -6).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let loadMsg = UILabel()
        loadMsg.textColor = .init(white: 1, alpha: 1)
        loadMsg.translatesAutoresizingMaskIntoConstraints = false
        loadMsg.font = .init(.systemFont(ofSize: 14, weight: .semibold))
        loadMsg.text = "Загрузка..."
        
        view.addSubview(loadMsg)
        loadMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadMsg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
        presenter?.fetchStructuralUnits()
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .white
        navigationItem.title = "Подразделения"
        self.navigationController?.navigationBar.barTintColor = .init("083757")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // MARK: - tableView
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // MARK: - loadingView
        view.addSubview(loadingView)
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.widthAnchor.constraint(equalTo: loadingView.heightAnchor).isActive = true
    }
}

extension StructuralUnitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structuralUnits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UnitTableViewCell.reuseIdentifier, for: indexPath) as? UnitTableViewCell else { fatalError() }
        let structuralUnit = structuralUnits[indexPath.row]
        cell.setup(structuralUnit)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension StructuralUnitsViewController: StructuralUnitsViewControllerProtocol {
    func showStructuralUnits(_ structuralUnits: [Subdivision]) {
        self.structuralUnits = structuralUnits
    }
    
    func showLoadingView() {
        loadingView.alpha = 0
        tableView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingView.alpha = 1
        })
    }
    
    func hideLoadingView() {
        loadingView.alpha = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingView.alpha = 0
        })
        tableView.alpha = 1
    }
}
