//
//  ViewController.swift
//  BXSocialAuth_Example
//
//  Created by Yiming Tang on 10/18/17.
//  Copyright © 2017 Yiming Tang. All rights reserved.
//

import UIKit
import BXSocialAuth


class ViewController: UITableViewController {

    let providerKeys = ["WeChat", "Tencent"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BXSocialAuthDemo Swift"
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providerKeys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = providerKeys[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let providerKey = providerKeys[indexPath.row]
        BXSocialAuth.sharedInstance().authorize(providerKey) { (result, error) in
            print("authorization finished")
        }
    }
}
