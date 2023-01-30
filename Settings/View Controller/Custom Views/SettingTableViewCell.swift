//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Dominique Strachan on 12/23/22.
//

import UIKit

/**
 The protocol we will use to handle the update of the cell when the `settingSwitch` has been toggled
 - class: This protocol needs to interact with class level objects
 */

protocol SettingCellDelegate: AnyObject {
    //Step one: Declare protocol
    ///protocol method
    func settingSwitchToggled(for cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {

    //AMRK: Outlets
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    //Step two: create delegate
    /**
     The delegate or *intern* for the protocol `SettingCellDelegate`
     
     - weak: we mark this method as weak to not create a retain cycle
     - optional: We do not want to set the value of the delegate here
     
     */
    weak var delegate: SettingCellDelegate?
    
    func updateViews(with setting: Setting) {
        settingNameLabel.text = setting.name
        settingImageView.image = setting.icon
        settingSwitch.isOn = setting.isOn
        
        //backgroundColor assigned
        //if setting is on then turn cyan else turn white
        //iBooks is cyan because set to true 
        backgroundColor = setting.isOn ? .cyan : .white
    }
    
    //MARK: Action
    @IBAction func settingSwitchToggled(_ sender: Any) {
        delegate?.settingSwitchToggled(for: self)
    }
    
}
