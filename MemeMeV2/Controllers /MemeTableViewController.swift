//
//  MemeTableViewController.swift
//  MemeMeV2
//
//  Created by Tracy Adams on 10/25/23.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    //create a property memes and set to memes array from AppDelegate
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            
            super.viewDidLoad()
    }
        
    override func viewWillAppear(_ animated: Bool) {
            
            super.viewWillAppear(animated)
            tableView.reloadData()
            
    }
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for:indexPath ) as! MemeTableViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        //setting a meme to the imageView property and label property of table cell
        cell.imageView?.image = meme.memed
        cell.label?.text = meme.topText + " ... " + meme.bottomText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(detailController, animated: true)
    }
    
    //go to the original ViewController
    @IBAction func plusButtonTapped(_ sender: UIBarButtonItem) {
        let createMemesVC = storyboard?.instantiateViewController(withIdentifier: "CreateAMeme") as! ViewController
        present(createMemesVC, animated: true, completion: nil)
    }
    
    
}

