//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by MacBook on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var crayons = [Crayon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    func loadData() {
        self.crayons = Crayon.allTheCrayons
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.text = crayon.hex
        cell.detailTextLabel?.textColor = .white
        cell.backgroundColor = UIColor(displayP3Red:        CGFloat(crayon.red/255.0),
                                       green: CGFloat(crayon.green/255.0),
                                       blue: CGFloat(crayon.blue/255.0), alpha: 1)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CrayonDetailViewController {
            destination.crayon = crayons[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
