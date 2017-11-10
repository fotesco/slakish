//
//  ToolbarVC.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa

class ToolbarVC: NSViewController {

    
    //Outlets
    
    @IBOutlet weak var loginImg: NSImageView!
    
    @IBOutlet weak var loginLbl: NSTextField!
    
    @IBOutlet weak var loginStack: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewDidAppear() {
        setUpView()
    }
    
    
    
    
    
    func setUpView () {
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()
        
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector (ToolbarVC.openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        print ("I just opened the profile page")
    }
    
}
