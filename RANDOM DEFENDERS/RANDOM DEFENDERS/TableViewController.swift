//
//  ViewController.swift
//  RANDOM DEFENDERS
//
//  Created by epita on 11/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension TableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return userTableViewCell()
    }
    
    
}
extension UITableViewController : UITableViewDelegate{
    
}
