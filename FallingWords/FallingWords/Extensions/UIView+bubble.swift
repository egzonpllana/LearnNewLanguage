//
//  UIView+bubble.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import UIKit

extension UIView {
    func bubble(scale transform: CGFloat = 1.15, with time: Double = 0.05) -> Void {
        UIView.animate(withDuration: time, animations: {
            self.transform = CGAffineTransform(scaleX: transform, y: transform)
            self.layoutIfNeeded()
        }) { (completed) in
            if completed {
                UIView.animate(withDuration: time, animations: {
                    self.transform = CGAffineTransform.identity
                    self.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
}
