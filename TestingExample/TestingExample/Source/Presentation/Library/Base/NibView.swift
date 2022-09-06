//
//  NibView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

struct Style {
    let font: UIFont
    let fontColor: UIColor
    let textAlignment: NSTextAlignment
}

class NibView: UIView {
    
    // MARK: - Properties
    
    private var view: UIView!
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        configureAppearance()
    }
    
    init(frame: CGRect, nibName: String) {
        super.init(frame: frame)
        xibSetup(nibName: nibName)
        configureAppearance()
    }
    
    
    // MARK: - Configuration
    
    func configureAppearance() {}
    
    func configureAccessibility() {}
    
    func apply(styles: [Style]) {}
    
    
    //MARK: - Lifecycle
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if newWindow == nil {
            viewWillDisappear()
        } else {
            viewWillAppear()
        }
    }
    
    func viewWillAppear() {}
    
    func viewWillDisappear() {}
    
}


extension NibView {
    
    func xibSetup(nibName: String? = nil) {
        self.backgroundColor = .clear
        self.view = loadNib(nibName: nibName)
        self.view.backgroundColor = .clear
        self.view.frame = bounds
        self.addSubview(self.view)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|", options: [], metrics: nil,  views: ["childView": self.view]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|", options: [], metrics: nil, views: ["childView": self.view]))
    }
    
}


private extension UIView {
    
    /// Loads instance from nib with the same name
    ///
    /// - Returns: UIView
    func loadNib(nibName: String?) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let name = nibName == nil ? type(of: self).description().components(separatedBy: ".").last! : nibName
        let nib = UINib(nibName: name!, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}
