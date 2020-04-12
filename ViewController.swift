//
//  ViewController.swift
//  TheBigBigProblem
//
//  Created by Assem on 4/12/20.
//  Copyright © 2020 Assem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageLabel: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func generateList(_ sender: UIButton) {
        tableView.refreshControl = refreshControl
        downloadCharacters()        
    }
    
    var characters: [Character] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(downloadCharacters), for: .valueChanged)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    @objc func downloadCharacters() {
        CharacterService.shared.DownloadCharacters(pageNum: pageLabel.text!) { response in
        self.characters = response.characters
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }


}

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterTableViewCell
        cell.character = self.characters[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
}
