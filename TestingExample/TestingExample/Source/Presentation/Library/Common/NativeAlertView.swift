//
//  NativeAlertView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

struct NativeAlertButton {
    let text: String
    var style: UIAlertAction.Style = .default
    var preferredAction: Bool = false
    var action: (() -> Void)? = nil
}

class NativeAlertView {
    
    // MARK: - Properties
    
    let alert: UIAlertController
    
    
    // MARK: - Init
    
    init(title: String, message: String? = nil, leftButton: NativeAlertButton, rightButton: NativeAlertButton? = nil) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let leftAction = UIAlertAction(title: leftButton.text, style: leftButton.style, handler: {_ in leftButton.action?() })
        alert.addAction(leftAction)
        if leftButton.preferredAction {
            alert.preferredAction = leftAction
        }
        
        guard let rightButton = rightButton else { return }
        let rightAction = UIAlertAction(title: rightButton.text, style: rightButton.style, handler: { _ in rightButton.action?()
        })
        alert.addAction(rightAction)
        if rightButton.preferredAction {
            alert.preferredAction = rightAction
        }
    }
    
}
