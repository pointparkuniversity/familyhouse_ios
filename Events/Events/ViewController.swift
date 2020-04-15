//
//  ViewController.swift
//  Events
//
//  Created by Emily VanderMey on 4/15/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBDesignable class GradientView: UIView {
        @IBInspectable var startColor: UIColor = UIColor.white
        @IBInspectable var endColor: UIColor = UIColor.white

        override class var layerClass: AnyClass {
            return CAGradientLayer.self
        }

        override func layoutSubviews() {
            (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
        }
    }



}

