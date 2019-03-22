//
//  Paddle.swift
//  BrickBreaker
//
//  Created by Roberto Garcia on 3/21/19.
//  Copyright © 2019 Roberto Garcia. All rights reserved.
//

import UIKit

class Paddle {
    
    
    init(movePaddle: UIView) {
        
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        movePaddle.addGestureRecognizer(recognizer)
        
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let view = recognizer.view!
        let translation = recognizer.translation(in: view)
        view.center.x += translation.x
        recognizer.setTranslation(.zero, in: view)
    
        
    }
}


