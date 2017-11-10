//
//  ToolbarVC.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa

//Enumerating modal types
enum ModalType {
    case logIn
}

class ToolbarVC: NSViewController {

    
    //Outlets
    @IBOutlet weak var loginImg: NSImageView!
    @IBOutlet weak var loginLbl: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
    
    //Variables
    var modalBGView: ClickBlockingView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewDidAppear() {
        setUpView()
    }

    func setUpView () {
        
        //Creating a notification observer
        NotificationCenter.default.addObserver(self, selector: #selector(ToolbarVC.presentModal(_:)), name: NOTIF_PRESENT_MODAL, object: nil)
        
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()
        
        
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector (ToolbarVC.openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        print ("I just opened the profile page")
        
        let loginDict: [String: ModalType] = [USER_INFO_MODAL: ModalType.logIn]
        
        NotificationCenter.default.post(name: NOTIF_PRESENT_MODAL, object: nil, userInfo: loginDict)
        
    }
    
    @objc func presentModal( _ notif: Notification) {
        print("present login modal")
        
        //Creating black, semi-transparent background
        
        if modalBGView == nil {
            modalBGView = ClickBlockingView()
            //Explicitly adding our own constraints
                modalBGView.translatesAutoresizingMaskIntoConstraints = false
                
                //adding Modal background on top of the loginStack view
                view.addSubview(modalBGView, positioned: .above, relativeTo: loginStack)
            
                //placing the background view across the view, adding constraints programmatically
                let topCn = NSLayoutConstraint(item: modalBGView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
                let leftCn = NSLayoutConstraint(item: modalBGView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
                let rightCn = NSLayoutConstraint(item: modalBGView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
                let bottomCn = NSLayoutConstraint(item: modalBGView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
                view.addConstraints([topCn, leftCn, rightCn, bottomCn])
                //changing color to black
                modalBGView.layer?.backgroundColor = CGColor.black
                modalBGView.alphaValue = 1.0
            
            }
        }
        
    }
    
    
    
    

