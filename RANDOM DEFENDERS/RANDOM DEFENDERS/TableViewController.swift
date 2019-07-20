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
        defViewController.result=selectRes
        
    }

    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=50&seed=PACHAIAPPAN")!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Person.self, from: data!)
                self.personArray = responseModel.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("JSON ERROR: ", error)
            }
            }.resume()
    }
    func formatName(name: Name) -> String {
        return name.title.capitalized + " " + name.first.capitalized + " " + name.last.uppercased()
    }
    
    func getImage(url : String)  -> UIImage{
        let data: Data = try! Data(contentsOf: URL(string: url)!)
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
            cell.labelname.text = formatName(name: person.name)
            cell.labelMail.text = person.email
            cell.imageRound.image = getImage(url: person.picture.thumbnail)
            cell.imageRound.layer.cornerRadius = cell.imageRound.frame.height / 2
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.6335943419, blue: 0.8775343255, alpha: 1)
        }
        return cell
    }
    
    
}

extension TableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRes = personArray![indexPath.row]
        performSegue(withIdentifier: "showDef", sender: nil)
    }
}
