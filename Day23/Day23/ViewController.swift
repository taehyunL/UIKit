//
//  ViewController.swift
//  Day23
//
//  Created by 이태현 on 2022/08/19.
//

import UIKit

class ViewController: UITableViewController {
    var countries: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                countries.append(item)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        let text = countries[indexPath.row].replacingOccurrences(of: "@3x.png", with: "")
        cell.textLabel?.text = text
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedName = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
}

