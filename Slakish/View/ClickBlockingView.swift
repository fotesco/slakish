//
//  ClickBlockingView.swift
//  Slakish
//
//  Created by BootCamp on 11/10/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa

class ClickBlockingView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func mouseUp(with event: NSEvent) {}
    override func mouseDown(with event: NSEvent) {}
    override func mouseMoved(with event: NSEvent) {}
    override func mouseDragged(with event: NSEvent) {}

    
}

