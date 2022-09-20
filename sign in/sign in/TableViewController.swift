//
//  TableViewController.swift
//  settingAccount
//
//  Created by الهنوف عبدالله  on 17/09/2022.
//

import Foundation
import UIKit


class TableViewController: UITableViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("THE SELECTED SECTION IS: \(indexPath.section)")
    }
    
}
