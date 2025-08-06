//
//  ViewController.swift
//  SimpsonBookApp
//
//  Created by Zeliha İnan on 6.08.2025.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons: [Simpson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Simpson Objects
        let homer = Simpson(nameInit: "Homer Simpson", jobInit: "Nuclear Power Plant Worker", imageInit: UIImage(named: "homer.jpg")!)
        let marge = Simpson(nameInit: "Marge Simpson", jobInit: "Stay at home mom", imageInit: UIImage(named: "marge.png")! )
        let bart = Simpson(nameInit: "Bart Simpson", jobInit: "Student", imageInit: UIImage(named: "bart.jpg")! )
        let lisa = Simpson(nameInit: "Lisa Simpson", jobInit: "Student", imageInit: UIImage(named: "lisa.png")! )
        let maggie = Simpson(nameInit: "Maggie Simpson", jobInit: "Toddler", imageInit: UIImage(named: "maggie.jpg")! )
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration( )
        content.text = mySimpsons[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedSimpson = mySimpsons[selectedIndexPath.row]
            }
        }
    }
}
