//
//  UIViewController+Storyboarded.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboard name: StoryboardNames) -> Self
}

extension UIViewController: Storyboarded {}


extension Storyboarded where Self: UIViewController {
    
    static func instantiate(storyboard name: StoryboardNames) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let bundle = Bundle(for: self) // Bundle.main
        let storyboard = UIStoryboard(name: name.rawValue.capitalizingFirstLetter(), bundle: bundle)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self // swiftlint:disable:this force_cast
    }
    
}


private extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
}
