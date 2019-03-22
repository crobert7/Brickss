//
//  ViewController.swift
//  BrickBreaker
//
//  Created by Roberto Garcia on 3/17/19.
//  Copyright © 2019 Roberto Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var paddle: UIView!
    var movePaddle: Paddle!
    
    var brick = Bricks()
    
    var bricksX = [Bricks]()
    var bricksY = [Bricks]()
    
    let ball = UIImage(named: "ball")
    var imageView = UIImageView()
    
    var animator = UIDynamicAnimator()
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: ball)
        imageView.frame.origin = CGPoint(x: view.center.x, y: view.center.x)
        view.addSubview(imageView)
        
    
        brick = Bricks(frame: CGRect(x:view.frame.size.width/8, y: 0, width: 100.0, height: view.frame.size.height/8))
        brick.layer.cornerRadius = 10
        brick.backgroundColor = UIColor.blue
        view.addSubview(brick)
        bricksX.append(brick)
        
        
        for _ in 0..<9 {
            guard let lastBrick = bricksX.last else { return }
            paintBricksX(frame: lastBrick.frame, color: .blue)
        }
        
        let brickY = Bricks(frame: CGRect(x: brick.frame.origin.x, y: brick.frame.origin.y + brick.frame.size.height, width: brick.frame.size.width, height: brick.frame.size.height))
        brickY.layer.cornerRadius = 10
        brickY.backgroundColor = .red
        bricksY.append(brickY)
        view.addSubview(brickY)
        
        for _ in 0..<9 {
            guard let lastBrick = bricksY.last else { return }
            paintBricksY(frame: lastBrick.frame, color: UIColor.random())
        }
        
        let brickY1 = Bricks(frame: CGRect(x: brickY.frame.origin.x, y: brickY.frame.origin.y + brick.frame.size.height, width: brick.frame.size.width, height: brick.frame.size.height))
        brickY1.layer.cornerRadius = 10
        brickY1.backgroundColor = .green
        bricksY.append(brickY1)
        view.addSubview(brickY1)
        
        for _ in 0..<9 {
            guard let lastBrick = bricksY.last else { return }
            paintBricksY1(frame: lastBrick.frame, color: UIColor.random())
        }
        
        
        let brickY2 = Bricks(frame: CGRect(x: brickY1.frame.origin.x, y: brickY1.frame.origin.y + brick.frame.size.height, width: brick.frame.size.width, height: brick.frame.size.height))
        brickY2.layer.cornerRadius = 10
        brickY2.backgroundColor = .cyan
        bricksY.append(brickY2)
        view.addSubview(brickY2)
        
        for _ in 0..<9 {
            guard let lastBrick = bricksY.last else { return }
            paintBricksY2(frame: lastBrick.frame, color: UIColor.random())
        }
        
        self.movePaddle = Paddle(movePaddle: paddle)
        self.animator = UIDynamicAnimator(referenceView: imageView.superview!)
        
        gravity = UIGravityBehavior(items: [imageView])
        animator.addBehavior(gravity)
    
        collision = UICollisionBehavior(items: [view])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    func paintBricksX(frame: CGRect, color: UIColor) {
        let brick = Bricks(frame: CGRect(x: frame.size.width + frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height))
        brick.layer.cornerRadius = 10
        brick.backgroundColor = UIColor.random()
        view.addSubview(brick)
        bricksX.append(brick)
    }
    
    func paintBricksY(frame: CGRect, color: UIColor) {
        let brick = Bricks(frame: CGRect(x: frame.origin.x + frame.size.width, y: view.frame.size.height/8, width: frame.size.width, height: frame.size.height))
        brick.layer.cornerRadius = 10
        brick.backgroundColor = UIColor.random()
        view.addSubview(brick)
        bricksY.append(brick)
    }
    
    func paintBricksY1(frame: CGRect, color: UIColor) {
        let brick = Bricks(frame: CGRect(x: frame.origin.x + frame.size.width, y: view.frame.size.height/8 * 2, width: frame.size.width, height: frame.size.height))
        brick.layer.cornerRadius = 10
        brick.backgroundColor = UIColor.random()
        view.addSubview(brick)
        bricksY.append(brick)
    }
    
    func paintBricksY2(frame: CGRect, color: UIColor) {
        let brick = Bricks(frame: CGRect(x: frame.origin.x + frame.size.width, y: view.frame.size.height/8 * 3, width: frame.size.width, height: frame.size.height))
        brick.layer.cornerRadius = 10
        brick.backgroundColor = UIColor.random()
        view.addSubview(brick)
        bricksY.append(brick)
    }
    
   
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
