//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var fontSize = Font.defaultFontSize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadAllMovies()
    }
    
    private var allMovies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private func loadAllMovies() {
        self.allMovies = Movie.allMovies
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fontSegue" else { fatalError() }
        guard let settingsVC = segue.destination as? FontSizeController else {
            fatalError()
        }
        settingsVC.delegate = self
        settingsVC.startingFontSize = fontSize
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell"){
            
            let movie = allMovies[indexPath.row]
            
            cell.textLabel?.text = movie.name
            cell.textLabel?.font = cell.textLabel?.font.withSize(fontSize)
            cell.detailTextLabel?.text = "\(movie.year)"
            cell.detailTextLabel?.font = cell.textLabel?.font.withSize(fontSize)

            return cell
            
        }
        
        return UITableViewCell()
    }
    
}

extension ViewController: FontResizable {
    func changeFontSize(_ newSize: CGFloat) {
        fontSize = newSize
    }
}
