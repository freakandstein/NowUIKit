//
//  ViewController.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Properties
    private let bundle = Bundle(for: MainViewController.self)
    private let className = String(describing: MainViewController.self)
    private let listMenu = [MainModel(component: Component.nowSnackbar, componentName: "Snack Bar")]
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Functions
    init() {
        super.init(nibName: className, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = "NowUIKit Preview"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MainViewCell.className, bundle: nil), forCellReuseIdentifier: MainViewCell.className)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.className,
                                                       for: indexPath) as? MainViewCell else { return UITableViewCell() }
        cell.setupCell(model: listMenu[indexPath.row])
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = listMenu[indexPath.row]
        switch model.component {
            case .nowSnackbar:
                print("NowSnackBar Show")
        }
    }
}

