
//  ViewController.swift
//  app
//
//  Created by Dwayne on 13/8/21.
//

import UIKit

struct User: Codable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

struct Users: Codable {
    var data: [User]
}

class TableRowVC: UIViewController {
    var user: User?
    init(user: User) {
        self.user = user
        //super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        self.user = nil
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView()
        textView.frame = self.view.bounds
        textView.text = user?.email
        let bg = UIView(frame: self.view.bounds)
        bg.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
        bg.addSubview(textView)
        view.addSubview(bg)
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users = [User]()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        view.addSubview(tableView)
        
        if let url = URL(string: "https://reqres.in/api/users") {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
                
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        print("parse that shit")

        if let jsonUsers = try? decoder.decode(Users.self, from: json) {
            print("decoded")
            users = jsonUsers.data
            print(users)
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")

        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
        }
        let user = users[indexPath.row]
        cell!.textLabel?.text = user.first_name + " " + user.last_name

        return cell!
    }

    // adding a row for each user
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TableRowVC(user: users[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
