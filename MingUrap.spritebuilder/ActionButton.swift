//
//  ActionButton.swift
//  MingUrap
//
//  Created by Abdulrahman AlZanki on 4/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class ActionButton : CCButton {
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if let p = parent as? MainScene {
            p.actionTapped()
        }
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
    }
}