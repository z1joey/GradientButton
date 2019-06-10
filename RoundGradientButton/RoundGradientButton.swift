//
//  GradientView.swift
//  GradientView
//
//  Created by Joey Zhang on 10/6/2019.
//  Copyright © 2019 TGI Technology. All rights reserved.
//

import UIKit

@IBDesignable class RoundGradientButton: UIButton{
    
    @IBInspectable public var firstColor: UIColor = UIColor.clear {
        didSet { updateView() }
    }
    
    @IBInspectable public var secondColor: UIColor = UIColor.clear {
        didSet { updateView() }
    }
    
    @IBInspectable public var isRound: Bool = true {
        didSet { updateView() }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    private func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map { $0.cgColor }
        
        if isRound {
            layer.cornerRadius = self.frame.height / 2
        } else {
            layer.cornerRadius = 0
        }

        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
}

