//
//  NowSnackBarViewController.swift
//  NobuNow
//
//  Created by Wahid Hidayat on 03/02/23.
//

import UIKit

enum SnackBarStyle {
    case neutral
    case error
}

enum NowButtonTitle: String {
    case ok = "OK"
    case cancel = "BATAL"
}

fileprivate class NowSnackBarViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var labelTrailingToSuperview: NSLayoutConstraint!
    @IBOutlet weak var labelTrailingToButton: NSLayoutConstraint!
    
    fileprivate var snackBarText: String = ""
    fileprivate var snackBarButtonText: NowButtonTitle? = nil
    fileprivate var snackBarStyle: SnackBarStyle = .neutral
    fileprivate var onClickButton: (() -> Void)? = nil
    fileprivate private(set) var isShowing = false
    
    fileprivate static let shared = NowSnackBarViewController()
    
    private init() {
        super.init(nibName: NowSnackBarViewController.className(), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.isShowing = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.isShowing = false
    }
    
    private func setupView() {
        messageLabel.text = snackBarText
        actionButton.isHidden = true
        
        if let buttonTitle = snackBarButtonText?.rawValue {
            setButtonTitle(buttonTitle: buttonTitle)
        }
        
        setSnackbarStyle(style: snackBarStyle)
    }
    
    fileprivate func setButtonTitle(buttonTitle: String?) {
        actionButton.isHidden = false
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.contentHorizontalAlignment = .right
        labelTrailingToSuperview.priority = .defaultLow
        labelTrailingToButton.priority = .defaultHigh
        view.layoutIfNeeded()
        
        if #available(iOS 15.0, *) {
            actionButton.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.Inter(type: .bold, size: 14)
                return outgoing
            }
        } else {
            actionButton.titleLabel?.font = UIFont.Inter(type: .bold, size: 14)
        }
    }
    
    fileprivate func setSnackbarStyle(style: SnackBarStyle) {
        switch snackBarStyle {
        case .neutral:
            containerView.backgroundColor = .blackText
            actionButton.setTitleColor(.primary30, for: .normal)
        case .error:
            containerView.backgroundColor = .error50
            actionButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func didActionButtonClicked(_ sender: UIButton) {
        guard let onClickButton else { return }
        onClickButton()
    }
}

class NowSnackBarWireframe {
    private init() {}
    
    static func show(
        message: String,
        style: SnackBarStyle = .neutral,
        buttonTitle: NowButtonTitle? = nil,
        avoidTabBar: Bool = false,
        duration: TimeInterval = 3,
        onClickButton: (() -> Void)? = nil
    ) {
        let vc = NowSnackBarViewController.shared
        vc.snackBarText = message
        vc.snackBarButtonText = buttonTitle
        vc.snackBarStyle = style
        vc.onClickButton = onClickButton
        
        if vc.isShowing == false {
            vc.showSnackBarBottom(duration: duration, avoidTabBar: avoidTabBar)
            vc.messageLabel.text = message
            if buttonTitle != nil {
                vc.setButtonTitle(buttonTitle: buttonTitle?.rawValue)
            }
            vc.setSnackbarStyle(style: style)
        }
    }
}
