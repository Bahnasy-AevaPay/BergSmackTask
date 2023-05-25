//
//  UIView+showLoader.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIView {
    func showLoader() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoader() {
        if let activityIndicator = viewWithTag(333) {
            activityIndicator.removeFromSuperview()
        }
    }
}


extension UIView {
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.style = .medium
        activityIndicator.tag = 333
        return activityIndicator
    }
}
