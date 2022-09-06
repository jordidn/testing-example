//
//  LoadingIndicatorView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

class LoadingIndicatorView: NibView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var loaderImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var color: UIColor = .black {
        didSet {
            loaderImageView.tintColor = color
        }
    }
    
    
    // MARK: - Overrides
    
    override func configureAppearance() {
        configureLoaderImage()
    }
    
    
    // MARK: - Public methods
    
    func startAnimating() {
        loaderImageView.isHidden = false
        loaderImageView.spin(duration: Float.greatestFiniteMagnitude)
    }
    
    func stopAnimating() {
        loaderImageView.isHidden = true
        loaderImageView.removeAllAnimations()
    }
    
    
    // MARK: - Private methods
    
    private func configureLoaderImage() {
        loaderImageView.isHidden = true
        loaderImageView.image = UIImage(systemName: "circles.hexagonpath")
    }
    
}



private extension UIImageView {
    
    func rotate(radians: CGFloat) {
        if radians == .zero {
            transform = .identity
        } else {
            transform = transform.rotated(by: radians)
        }
    }
    
    func spin(duration: Float) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 0.7
        rotation.repeatCount = duration
        layer.add(rotation, forKey: "spin")
    }
    
    func removeAllAnimations() {
        self.layer.removeAllAnimations()
    }
    
}
