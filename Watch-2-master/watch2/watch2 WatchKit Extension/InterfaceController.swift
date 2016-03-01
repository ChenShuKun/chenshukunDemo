//
//  InterfaceController.swift
//  watch2 WatchKit Extension
//
//  Created by xiaobo on 15/4/22.
//  Copyright (c) 2015年 xiaobo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var imgAnime: WKInterfaceImage!

    @IBAction func startGame() {
        
        imgAnime.setImageNamed("anime")
        imgAnime.startAnimatingWithImagesInRange(NSMakeRange(0, 3), duration: 0.3, repeatCount: 3)

        delay(0.9, closure: { () -> () in
            let imageNumber = arc4random_uniform(3)
            self.imgAnime.setImageNamed("anime\(imageNumber)")
        })
    }
    
    //指定等待时间
    func delay(seconds: Double, closure:() -> () ) {
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
