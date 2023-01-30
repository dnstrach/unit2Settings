//
//  SettingsTableViewController.swift
//  Settings
//
//  Created by Dominique Strachan on 12/23/22.
//

import UIKit

///TableViewController to display our settings objects
class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///we want the number of cells to match the number of 'Setting' objects in our *Source of truth*
        //have access because settings array in setting controller is static
        return SettingController.settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //not using because we are customizing cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        
        //as? - optional type casting
        ///type casting our tableView cell to be a 'SettingTableViewCell' and guarding against the falling, If it fails; we return an empty UITableViewCell initialized
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        ///declaring a constant named 'Setting', using the `indexPath` that was passed into the `cellForRow(at: )`, we assign it to the value of the `Setting` object that matches the row property of the `indexPath`
        let setting = SettingController.settings[indexPath.row]
        ///Setting the cells delegate to the `TableViewController` I.E. Hiring the intern for the relationship
        cell.delegate = self
        ///accessing the `updateViews` method on our cell and passing in the `setting` object we declared above
        cell.updateViews(with: setting)
        //optional click cell is now settingtableviewcell and not UITablwViewCell
        return cell
    }

} //end of class

///Adopting the `SettingCellDelegate` Protocol
extension SettingsTableViewController: SettingCellDelegate {
    ///Conforming to the Protocol
    func settingSwitchToggled(for cell: SettingTableViewCell) {
        ///We asked out TBVC to be our delegate because it can tell us what the indexPath is for the cell that triggered this protocol method
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        ///Find the `setting` in the settings array that match the 'indexPath
        let setting = SettingController.settings[indexPath.row]
        ///Tell the model controller to toggle the `isOn` change on the `Setting`
        SettingController.togggleIsOn(for: setting)
        ///Inform the cell it is now time to update
        cell.updateViews(with: setting)
    }
}
