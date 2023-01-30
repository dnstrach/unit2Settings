//
//  Setting.swift
//  Settings
//
//  Created by Dominique Strachan on 12/23/22.
//

//import Foundation

//automatically imports foundation
//gives access to provide UIImage type for icon
import UIKit

/**
 creates our setting object - "Model"
- Properties:
    - name: the 'String' identifier for the setting
    - icon: the 'UIImage' that matches the setting
    - isOn: The 'Bool' the designate whether the setting is on or off
 */

class Setting {
    var name: String
    //don't declate icon with Image because image is an apple property
    var icon: UIImage
    var isOn: Bool
    
    //initializer with its parameters
    init(name: String, icon: UIImage, isOn: Bool) {
        self.name = name
        self.icon = icon
        self.isOn = isOn
    }
}
