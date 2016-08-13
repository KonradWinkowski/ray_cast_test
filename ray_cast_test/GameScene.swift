//
//  GameScene.swift
//  ray_cast_test
//
//  Created by Konrad Winkowski on 8/10/16.
//  Copyright (c) 2016 KonradWinkowski. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var main_sprite : SKSpriteNode!
    var move = false
    
    override func didMoveToView(view: SKView) {
        
        
        let world = SKNode.init()
        world.name = "world"
        self.addChild(world)
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0)
        
        main_sprite = SKSpriteNode.init(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        main_sprite.position = CGPointMake( 50, view.frame.size.height / 2.0)
        main_sprite.physicsBody = SKPhysicsBody.init(rectangleOfSize: main_sprite.size)
        //        main_sprite.physicsBody?.dynamic = false
        
        let camera_node = SKCameraNode.init()
        self.camera = camera_node
        
        world.addChild(self.camera!)
        world.addChild(main_sprite)
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(createBlock), userInfo: nil, repeats: true)
        
    }
    
    func random(min: Int, _ max: Int) -> Int {
        guard min < max else {return min}
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
    
    func createBlock() {
        let test_sprite = SKSpriteNode.init(color: UIColor.orangeColor(), size: main_sprite.size)
        test_sprite.position = CGPointMake(main_sprite.position.x + self.frame.size.width, CGFloat(self.random(Int(main_sprite.position.y) - 500, Int(main_sprite.position.y) + 500)))
        test_sprite.physicsBody = SKPhysicsBody.init(rectangleOfSize: test_sprite.size)
        test_sprite.name = "test_sprite"
        self.getWorld().addChild(test_sprite)
    }
    
    func degreesToRadians(value : Float) -> Float {
        return (value * Float(M_PI) / 180.0)
    }
    func radiansToDegrees(value : Float) -> Float {
        return (value * 180.0 / Float(M_PI))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        //        move = true
        
        main_sprite.physicsBody?.applyImpulse(CGVectorMake(10.0, 0.0))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        move = false
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if move {
            var point = main_sprite.position
            point.x += 5
            main_sprite.position = point
        }
        
        self.camera?.position = main_sprite.position
        
        if let ray_one = self.getWorld().childNodeWithName("ray1"){
            ray_one.removeFromParent()
        }
        if let ray_two = self.getWorld().childNodeWithName("ray2"){
            ray_two.removeFromParent()
        }
        if let ray_thr = self.getWorld().childNodeWithName("ray3"){
            ray_thr.removeFromParent()
        }
        if let ray_two = self.getWorld().childNodeWithName("ray4"){
            ray_two.removeFromParent()
        }
        if let ray_thr = self.getWorld().childNodeWithName("ray5"){
            ray_thr.removeFromParent()
        }
        
        var x = 0 + 200 * cos(self.degreesToRadians(30.0))
        var y = 0 + 200 * sin(self.degreesToRadians(30.0))
        let ray_one_path = UIBezierPath.init()
        ray_one_path.moveToPoint(CGPointMake(0, 0))
        ray_one_path.addLineToPoint(CGPointMake(CGFloat(x), CGFloat(y)))
        
        let ray_one = SKShapeNode.init(path: ray_one_path.CGPath)
        ray_one.name = "ray1"
        ray_one.fillColor = UIColor.blueColor()
        ray_one.lineWidth = 2.0
        ray_one.position = main_sprite.position
        self.getWorld().addChild(ray_one)
        
        x = 0 + 200 * cos(self.degreesToRadians(15.0))
        y = 0 + 200 * sin(self.degreesToRadians(15.0))
        let ray_two1_path = UIBezierPath.init()
        ray_two1_path.moveToPoint(CGPointMake(0, 0))
        ray_two1_path.addLineToPoint(CGPointMake(CGFloat(x), CGFloat(y)))
        
        let ray_two1 = SKShapeNode.init(path: ray_two1_path.CGPath)
        ray_two1.name = "ray2"
        ray_two1.fillColor = UIColor.blueColor()
        ray_two1.lineWidth = 2.0
        ray_two1.position = main_sprite.position
        self.getWorld().addChild(ray_two1)
        
        x = 0 + 200 * cos(self.degreesToRadians(0.0))
        y = 0 + 200 * sin(self.degreesToRadians(0.0))
        let ray_two_path = UIBezierPath.init()
        ray_two_path.moveToPoint(CGPointMake(0, 0))
        ray_two_path.addLineToPoint(CGPointMake(CGFloat(x), CGFloat(y)))
        
        let ray_two = SKShapeNode.init(path: ray_two_path.CGPath)
        ray_two.name = "ray3"
        ray_two.fillColor = UIColor.blueColor()
        ray_two.lineWidth = 2.0
        ray_two.position = main_sprite.position
        self.getWorld().addChild(ray_two)
        
        x = 0 + 200 * cos(self.degreesToRadians(-15.0))
        y = 0 + 200 * sin(self.degreesToRadians(-15.0))
        let ray_thr1_path = UIBezierPath.init()
        ray_thr1_path.moveToPoint(CGPointMake(0, 0))
        ray_thr1_path.addLineToPoint(CGPointMake(CGFloat(x), CGFloat(y)))
        
        let ray_thr1 = SKShapeNode.init(path: ray_thr1_path.CGPath)
        ray_thr1.name = "ray4"
        ray_thr1.fillColor = UIColor.blueColor()
        ray_thr1.lineWidth = 2.0
        ray_thr1.position = main_sprite.position
        self.getWorld().addChild(ray_thr1)
        
        x = 0 + 200 * cos(self.degreesToRadians(-30.0))
        y = 0 + 200 * sin(self.degreesToRadians(-30.0))
        let ray_thr_path = UIBezierPath.init()
        ray_thr_path.moveToPoint(CGPointMake(0, 0))
        ray_thr_path.addLineToPoint(CGPointMake(CGFloat(x), CGFloat(y)))
        
        let ray_thr = SKShapeNode.init(path: ray_thr_path.CGPath)
        ray_thr.name = "ray5"
        ray_thr.fillColor = UIColor.blueColor()
        ray_thr.lineWidth = 2.0
        ray_thr.position = main_sprite.position
        self.getWorld().addChild(ray_thr)
        
        let converted_point = self.convertPoint(main_sprite.position, toNode: self)
        
        var ray_one_end_x = Float(converted_point.x) + 200 * cos(self.degreesToRadians(30.0))
        var ray_one_end_y = Float(converted_point.y) + 200 * sin(self.degreesToRadians(30.0))
        let body_one = self.physicsWorld.bodyAlongRayStart(main_sprite.position, end: CGPointMake(CGFloat(ray_one_end_x), CGFloat(ray_one_end_y)))
        
        if let in_way_body = body_one{
            print(in_way_body)
            var point = main_sprite.position
            point.y -= 1
            main_sprite.position = point
            ray_one.strokeColor = UIColor.greenColor()
        }
        
        ray_one_end_x = Float(converted_point.x) + 200 * cos(self.degreesToRadians(15.0))
        ray_one_end_y = Float(converted_point.y) + 200 * sin(self.degreesToRadians(15.0))
        let body_two1 = self.physicsWorld.bodyAlongRayStart(main_sprite.position, end: CGPointMake(CGFloat(ray_one_end_x), CGFloat(ray_one_end_y)))
        
        if let in_way_body = body_two1{
            print(in_way_body)
            var point = main_sprite.position
            point.y -= 2
            main_sprite.position = point
            ray_two1.strokeColor = UIColor.greenColor()
        }
        
        ray_one_end_x = Float(converted_point.x) + 200 * cos(self.degreesToRadians(0.0))
        ray_one_end_y = Float(converted_point.y) + 200 * sin(self.degreesToRadians(0.0))
        let body_two = self.physicsWorld.bodyAlongRayStart(main_sprite.position, end: CGPointMake(CGFloat(ray_one_end_x), CGFloat(ray_one_end_y)))
        
        if let in_way_body = body_two{
            print(in_way_body)
            var point = main_sprite.position
            point.y -= 4
            main_sprite.position = point
            ray_two.strokeColor = UIColor.greenColor()
        }
        
        ray_one_end_x = Float(converted_point.x) + 200 * cos(self.degreesToRadians(-15.0))
        ray_one_end_y = Float(converted_point.y) + 200 * sin(self.degreesToRadians(-15.0))
        let body_three1 = self.physicsWorld.bodyAlongRayStart(main_sprite.position, end: CGPointMake(CGFloat(ray_one_end_x), CGFloat(ray_one_end_y)))
        
        if let in_way_body = body_three1{
            print(in_way_body)
            var point = main_sprite.position
            point.y += 2
            main_sprite.position = point
            ray_thr1.strokeColor = UIColor.greenColor()
        }
        
        ray_one_end_x = Float(converted_point.x) + 200 * cos(self.degreesToRadians(-30.0))
        ray_one_end_y = Float(converted_point.y) + 200 * sin(self.degreesToRadians(-30.0))
        let body_three = self.physicsWorld.bodyAlongRayStart(main_sprite.position, end: CGPointMake(CGFloat(ray_one_end_x), CGFloat(ray_one_end_y)))
        
        if let in_way_body = body_three{
            print(in_way_body)
            var point = main_sprite.position
            point.y += 1
            main_sprite.position = point
            ray_thr.strokeColor = UIColor.greenColor()
        }
        
        
    }
    
    func getWorld() -> SKNode {
        return self.childNodeWithName("world")!
    }
}
