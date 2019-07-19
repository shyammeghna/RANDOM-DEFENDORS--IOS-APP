//
//  Def_ViewController.swift
//  RANDOM DEFENDERS
//
//  Created by epita on 19/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class Def_ViewController: UIViewController {

    var result:PersonDetail?
    @IBOutlet weak var Lname: UILabel!
    @IBOutlet weak var Lstreet: UILabel!
    @IBOutlet weak var Lcity: UILabel!
    @IBOutlet weak var Lemail: UILabel!
    @IBOutlet weak var Lphone: UILabel!
    @IBOutlet weak var Lcell: UILabel!
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         showdata()
    }
    func formatName(userName: Name) -> String {
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    
    func showdata(){
        let name = formatName(userName: result!.name)
        Lname.text = name
        Lemail.text = result?.email
        Lcell.text = result?.cell
        Lphone.text = result?.phone
        Lstreet.text = result?.location.street
        Lcity.text = result?.location.city
        setImage(url: URL(string: (result?.picture.large)!)!)
    }
    
    func setImage(url : URL) {
        let data: Data = try! Data(contentsOf: url)
        image.image = UIImage(data: data)
    }
    
    

    

}
