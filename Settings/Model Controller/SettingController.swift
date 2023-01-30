//
//  SettingController.swift
//  Settings
//
//  Created by Dominique Strachan on 12/23/22.
//

import Foundation
import UIKit
///our model controller class
class SettingController {
    /**
    source of truth - setting array/
    use singleton if interacting with that one single source of truth with data changing
    computation is recreating source of truth every time so do not need singleton
     created a computated property named 'settings' and declared the type to be an array of 'Setting' objects
     - returns: the mock setting objects we created in the array
     */
    static let settings: [Setting] = {
        //marked as static so that we can access this array on a separate file
        let music = Setting(name: "Music", icon: UIImage(imageLiteralResourceName: "iTunes"), isOn: false)
        let appStore = Setting(name: "App Store", icon: UIImage(imageLiteralResourceName: "appStore"), isOn: false)
        let iBooks = Setting(name: "iBooks", icon: UIImage(imageLiteralResourceName: "iBooks"), isOn: true)
        return [music, appStore, iBooks]
     //invoking computations
    }()
    /**
     Toggles the 'isOn' property on a 'Setting' object to the opposite state
     - Parameters:
        - setting: the setting object we wish to change the 'isOn' of
     */
    static func togggleIsOn(for setting: Setting) {
        setting.isOn = !setting.isOn
    }
}
