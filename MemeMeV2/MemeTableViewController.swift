//
//  MemeTableViewController.swift
//  MemeMeV2
//
//  Created by Tracy Adams on 10/25/23.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    
    //for the tableView...
    // MARK: Properties
    //create a property memes and set to memes array from AppDelegate
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var create: UIBarButtonItem!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            tableView.reloadData()
            //tableView.allowsSelection = false
        }
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
            
            if memes.count > 0 {
                tableView.allowsSelection = true
            }
        }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        //setting a meme to the imageView property of table cell
        cell.imageView?.image = meme.memed
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    //go to the original viewcontroller
    @IBAction func plusButtonTapped(_ sender: UIBarButtonItem) {
        let createMemesVC = storyboard?.instantiateViewController(withIdentifier: "CreateAMeme") as! ViewController
        present(createMemesVC, animated: true, completion: nil)
    }
    
    
}

