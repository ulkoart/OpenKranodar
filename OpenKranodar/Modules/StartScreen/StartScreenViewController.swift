//
//  StartScreenViewController.swift
//  OpenKranodar
//
//  Created by user on 12.09.2021.
//

import UIKit

protocol StartScreenViewControllerProtocol: AnyObject {
    func webSiteButtonAction() -> Void
    func CommunicationEditorsButtonAction() -> Void
}

final class StartScreenViewController: UIViewController {
    
    var presenter: StartScreenPresenterProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Добро пожаловать в\n«Открытый Краснодар»")
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 3
        attributedString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = attributedString
        label.textColor = .deepBlue
        label.font = .init(.systemFont(ofSize: 22, weight: .black))
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Мобильное приложение «Открытый Краснодар» позволит ознакомиться с информацией о структуре администрации, руководителях структурных подразделений, о транспортной инфраструктуре, гостиницах и многом другом."
        label.textColor = .gray
        label.font = .init(.systemFont(ofSize: 14, weight: .thin))
        label.numberOfLines = 6
        label.textAlignment = .left
        return label
    }()
    
    private let webSiteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сайт «Открытый Краснодар»", for: .normal)
        button.setTitleColor(.deepBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.deepBlue.cgColor
        button.addTarget(self, action: #selector(webSiteButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let communicationEditorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Связь с редакцией", for: .normal)
        button.setTitleColor(.deepBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.deepBlue.cgColor
        button.addTarget(self, action: #selector(CommunicationEditorsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let goToAppButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .deepBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти в приложение", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .semibold))
        button.addTarget(self, action: #selector(goToAppButtonAction), for: .touchUpInside)
        return button
    }()
    
//    private let doneView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .lightGray
//        view.layer.cornerRadius = 8.0
//        view.alpha = 0
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        let doneImageView = UIImageView(image: UIImage(named: "done"))
//        doneImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(doneImageView)
//        doneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        doneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        doneImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
//        doneImageView.widthAnchor.constraint(equalTo: doneImageView.heightAnchor).isActive = true
//
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

//    private func showDone() {
//        doneView.alpha = 1
//        UIView.animate(withDuration: 1, animations: {
//            self.doneView.alpha = 0
//        })
//    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // MARK: - titleLabel
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.width / 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: - descriptionLabel
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: - webSiteButton
        view.addSubview(webSiteButton)
        webSiteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        webSiteButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 48).isActive = true
        webSiteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        webSiteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        webSiteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: - communicationEditorsButton
        view.addSubview(communicationEditorsButton)
        communicationEditorsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        communicationEditorsButton.topAnchor.constraint(equalTo: webSiteButton.bottomAnchor, constant: 8).isActive = true
        communicationEditorsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        communicationEditorsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        communicationEditorsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: - goToAppButton
        view.addSubview(goToAppButton)
        goToAppButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        goToAppButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        goToAppButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        goToAppButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        goToAppButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // MARK: - doneView
        // view.addSubview(doneView)
        // doneView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // doneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // doneView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        // doneView.widthAnchor.constraint(equalTo: doneView.heightAnchor).isActive = true
        
    }
}

extension StartScreenViewController: StartScreenViewControllerProtocol {
    
    @objc func webSiteButtonAction() {
        presenter?.openWebSite()
    }
    
    @objc func CommunicationEditorsButtonAction() {
        presenter?.openCommunicationEditors()
    }
    
    @objc func goToAppButtonAction() {
        presenter?.goToApp()
    }
}
