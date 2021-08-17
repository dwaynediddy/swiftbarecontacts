
//  ViewController.swift
//  app
//
//  Created by Dwayne on 13/8/21.
//

import UIKit

class TableRowVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("yeeeeeeeeet")
        
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        var tableView = UITableView()
    
//        var contacts = [Contact]()
    
        var petitions = [Petition]()
    
    
//        let contacts:[[String]] = [
//            ["Elon Musk",       "+1-201-3141-5926"],
//            ["Bill Gates",      "+1-202-5358-9793"],
//            ["Tim Cook",        "+1-203-2384-6264"],
//            ["Richard Branson", "+1-204-3383-2795"],
//            ["Jeff Bezos",      "+1-205-0288-4197"],
//            ["Warren Buffet",   "+1-206-1693-9937"],
//            ["The Zuck",        "+1-207-5105-8209"],
//            ["Carlos Slim",     "+1-208-7494-4592"],
//            ["Bill Gates",      "+1-209-3078-1640"],
//            ["Larry Page",      "+1-210-6286-2089"],
//            ["Harold Finch",    "+1-211-9862-8034"],
//            ["Sergey Brin",     "+1-212-8253-4211"],
//            ["Jack Ma",         "+1-213-7067-9821"],
//            ["Steve Ballmer",   "+1-214-4808-6513"],
//            ["Phil Knight",     "+1-215-2823-0664"],
//            ["Paul Allen",      "+1-216-7093-8446"],
//            ["Woz",             "+1-217-0955-0582"]
//        ]
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = UIColor.yellow
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
            view.addSubview(tableView)
            
//            let urlString = "https://reqres.in/api/users"
            let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
            
//            if let url = URL(string: urlString) {
//                if let data = try? Data(contentsOf: url) {
//                    parse(json: data)
//                }
//
//            }
                    
    
//    func parse(json: Data) {
//        let decoder = JSONDecoder()
//
//        if let jsonContacts = try? decoder.decode(Contacts.self, from: json) {
//                contacts = jsonContacts.results
//                tableView.reloadData()
//            }
//        }
//    }
            

            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    // we're OK to parse!
                    parse(json: data)
                }
            }
        }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")

            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
            }

            print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
            let petition = petitions[indexPath.row]
            cell?.textLabel?.text = petition.title
            cell?.detailTextLabel?.text = petition.body
//            cell!.textLabel?.text = petitions[indexPath.row][0]
            
//            can uncomment to add phone numbers under names
//            cell!.detailTextLabel?.text = contacts[indexPath.row][1]

            return cell!
        }
        // adding a row for each user
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return petitions.count
            }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> UITableViewCell
        {
            //let contact = contacts[indexPath.row]
            let vc = TableRowVC()
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")

            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
            }

            print("whhhaattttt")
            navigationController!.pushViewController(vc, animated: true)
            
            let petition = petitions[indexPath.row]
            cell?.textLabel?.text = petition.title
            cell?.detailTextLabel?.text = petition.body
            
            return cell!
//            show(vc, sender: self)
        }
    
    }
    


