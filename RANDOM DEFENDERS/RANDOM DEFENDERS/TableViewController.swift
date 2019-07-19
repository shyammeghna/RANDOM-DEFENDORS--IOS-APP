//
//  ViewController.swift
//  RANDOM DEFENDERS
//
//  Created by epita on 11/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var personArray : [PersonDetail]?
    var selectRes :PersonDetail?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchUsers()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let defViewController = segue.destination as? Def_ViewController else {
            return
        }
        print("Ready")
        defViewController.result=selectRes
        
    }

    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=10")!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Person.self, from: data!)
                self.personArray = responseModel.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(responseModel)
            } catch let error {
                print("JSON Serialization ERROR: ", error)
            }
            }.resume()
    }
    func formatName(userName: Name) -> String {
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    
    func getImage(url : URL)  -> UIImage{
        let data: Data = try! Data(contentsOf: url)
        return UIImage(data: data) ?? UIImage()
    }
    
}

extension TableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? userTableViewCell else {
            return UITableViewCell()
        }
        
        if let person = personArray?[indexPath.row] {
            print("test")
            cell.labelname.text = person.name.first
            cell.labelMail.text = person.email
            
        }
        return cell
    }
    
    
}

extension TableViewController : UITableViewDelegate{

}
