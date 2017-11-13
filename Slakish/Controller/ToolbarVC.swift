//
//  ToolbarVC.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa
import ADAL


//Enumerating modal types
enum ModalType {
    case logIn
}


class ToolbarVC: NSViewController {
    
    
    
    //ADAL Constants (temporary here)
    // Configurations
    
//    let AUTHORITY_URL = "https://login.microsoftonline.com/common" //COMMON OR YOUR TENANT ID
//    let CLIENT_ID = "6ecd4a08-9ecb-4be5-b6f3-aac996a76b0f" //This is your client ID
//    let REDIRECT_URI = "http://localhost" //This is your redirect URI
    

    //Outlets
    @IBOutlet weak var loginImg: NSImageView!
    @IBOutlet weak var loginLbl: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
   
    
    

    //Variables
    var modalBGView: ClickBlockingView!
    var modalView: NSView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
       
    }
    
    override func viewDidAppear() {
        setUpView()
    }
    
    func setUpView () {
        
        //Creating a notification observer to open the modal
        NotificationCenter.default.addObserver(self, selector: #selector(ToolbarVC.presentModal(_:)), name: NOTIF_PRESENT_MODAL, object: nil)
        
        //Creating a notification observer to close the modal
        NotificationCenter.default.addObserver(self, selector: #selector(ToolbarVC.closeModalNotif(_:)), name: NOTIF_CLOSE_MODAL, object: nil)
        
        
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
    
    //Presenting the modal after Profile/Login button is clicked
    @objc func presentModal( _ notif: Notification) {
        print("present login modal")
        
        //Initializing modal sizes
        var modalWidth = 0
        var modalHeight = 0
        
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
            modalBGView.alphaValue = 0.0
            
            //initializing the close modal through background click gesture rec.
            let closeBackgroundClick = NSClickGestureRecognizer (target: self, action: #selector(ToolbarVC.closeModalClick(_:)))
            
            //adding the gesture recognizer to close the modalBackgroundView
            modalBGView.addGestureRecognizer(closeBackgroundClick)
            
            // Instantiating the Xib file for the modal
            //checking the type of modal from the notification list
            guard let modalType = notif.userInfo?[USER_INFO_MODAL] as? ModalType
                else { return }
            
            switch modalType {
            case ModalType.logIn:
                modalView = ModalLogin()
                modalWidth = 475
                modalHeight = 300
            }
            
            modalView.wantsLayer = true
            modalView.translatesAutoresizingMaskIntoConstraints = false
            modalView.alphaValue = 0
            
            //positioning actual modal view above the modal background view
            view.addSubview(modalView, positioned: .above, relativeTo: modalBGView)
            
            //assigning constraints manually, see line 113
            let horizontalConstraint = modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let verticalConstraint = modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            let widthConstraint = modalView.widthAnchor.constraint(equalToConstant: CGFloat(modalWidth))
            let heightConstraint = modalView.heightAnchor.constraint(equalToConstant: CGFloat(modalHeight))
            
            //activating constraints
             NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        }
        
        //Fade in animation for the modal background
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalBGView.animator().alphaValue = 0.6
            modalView.animator().alphaValue = 1.0
            self.view.layoutSubtreeIfNeeded()
            
        }, completionHandler: nil)
        
    }
    
    //Close modal gesture recognizer
    @objc func closeModalClick (_ recognizer: NSClickGestureRecognizer){
        closeModal()
    }
    
    @objc func closeModalNotif(_ notif: Notification){
        closeModal()
    }

    //Close modal function
    @objc func closeModal(_ removeImmediately: Bool = false) {
        if removeImmediately {
           self.modalView.removeFromSuperview()
        } else {
            
            //Fade out animation for the modal background
            NSAnimationContext.runAnimationGroup({ (context) in
                context.duration = 0.5
                modalBGView.animator().alphaValue = 0.0
                modalView.animator().alphaValue = 0.0
                self.view.layoutSubtreeIfNeeded()
            }, completionHandler: {
                if self.modalBGView != nil {
                    self.modalBGView.removeFromSuperview()
                    self.modalBGView = nil
                }
                
                //closing the modal as well when clicked on the background
                self.modalView.removeFromSuperview()
            })
        }
    }
    
    
   
    
    
}





