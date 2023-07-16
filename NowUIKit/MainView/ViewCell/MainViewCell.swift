//
//  MainViewCell.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import Foundation
import UIKit

class MainViewCell: UITableViewCell {
        
    //MARK: Properties
    public static let className = String(describing: MainViewCell.self)
    private let bundle = Bundle(for: MainViewCell.self)
    
    //MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    func setupCell(model: MainModel) {
        titleLabel.text = model.componentName
    }
}
