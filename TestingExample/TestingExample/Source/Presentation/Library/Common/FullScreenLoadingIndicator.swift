//
//  FullScreenLoadingIndicator.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

/// Covers a view completly, and shows a loading indicator and a message.
class FullScreenLoadingIndicator: NibView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingIndicatorView: LoadingIndicatorView!
    @IBOutlet private weak var labelMessage: UILabel!
    @IBOutlet private weak var labelTopConstraint: NSLayoutConstraint!
    
    
    // MARK: - Init
    
    /// Initalizes loader view with window frame, adds loader to keyWindow removing interaction events and starts animating.
    required public init(loadingIndicatorMessage: LoadingIndicatorMessage? = nil, alpha: CGFloat = 0.5) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        UIApplication.shared.keyWindow?.addSubview(self)
        self.loadingView.isUserInteractionEnabled = false
        self.loadingView.alpha = alpha
        
        setupLoadingIndicatorView()
        configureLoadingMessage(with: loadingIndicatorMessage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    /// Remove the activity indicator from it's superview and ends ignoring interaction events.
    func remove() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicatorView.stopAnimating()
            self?.loadingView.isUserInteractionEnabled = true
            self?.removeFromSuperview()
            let animation = CATransition()
            self?.superview?.layer.add(animation, forKey: "layerAnimation")
        }
    }
    
    
    // MARK: - Private methods
    
    private func setupLoadingIndicatorView() {
        loadingIndicatorView.color = .black
        loadingIndicatorView.startAnimating()
    }
    
    private func configureLoadingMessage(with loadingIndicatorMessage: LoadingIndicatorMessage?) {
        guard let loadingIndicatorMessage = loadingIndicatorMessage else { return }
        
        switch loadingIndicatorMessage {
        case .big(let message), .regular(let message):
            guard !message.isEmpty else { return }
            labelMessage.font = loadingIndicatorMessage.fontType
            labelMessage.text = message
            labelTopConstraint.constant = loadingIndicatorMessage.topConstraintValue
        }
    }
    
}



enum LoadingIndicatorMessage {
    case big(message: String)
    case regular(message: String)
    
    var fontSize: CGFloat {
        switch self {
        case .big:
            return 21
        case .regular:
            return 13
        }
    }
    
    var fontType: UIFont {
        return .systemFont(ofSize: fontSize)
    }
    
    var topConstraintValue: CGFloat {
        switch self {
        case .big:
            return 24
        case .regular:
            return 8
        }
    }
}

