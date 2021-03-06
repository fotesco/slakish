//
//  Constants.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Foundation
import Cocoa

//Colors

let chatPurple = NSColor(calibratedRed: 0.30, green: 0.22, blue: 0.29, alpha: 1.00)
let chatGreen = NSColor(calibratedRed: 0.22, green: 0.66, blue: 0.68, alpha: 1.00)
//Fonts

let avenirRegular = "AvenirNext-Regular"
let avenirBold = "AvenirNext-Bold"

//NOTIFICATIONS
let USER_INFO_MODAL = "modalUserInfo"
let NOTIF_PRESENT_MODAL = Notification.Name("presentModal")
let NOTIF_CLOSE_MODAL = Notification.Name("closeModal")
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let USER_ALIAS = "userAlias"
let USER_FULLNAME = "userFullName"
