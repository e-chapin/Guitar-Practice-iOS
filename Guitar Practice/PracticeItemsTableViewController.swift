//
//  PracticeItemsTableViewController.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/10/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit

class PracticeItemsTableViewController: UITableViewController {
    
    var items = [PracticeItem]()
    
    // MARK: Actions
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PracticeItemViewController, let practiceItem = sourceViewController.practiceItem {
            let newIndexPath = IndexPath(row: items.count, section: 0)
            items.append(practiceItem)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // MARK: Private functions
    
    private func loadSampleItems(){
        
        guard let item1 = PracticeItem(name: "Minor Pentatonic Scales") else{
            fatalError("Unable to instantiate item1")
        }
        guard let item2 = PracticeItem(name: "Major Pentatonic Scales") else{
                   fatalError("Unable to instantiate item2")
               }
        guard let item3 = PracticeItem(name: "Backing Track Improv") else{
                   fatalError("Unable to instantiate item3")
               }
        
        items += [item1, item2, item3]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PracticeItemTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PracticeItemTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PracticeItemTableViewCell.")
        }

        // Fetches the appropriate meal for the data source layout.
        let item = items[indexPath.row]

        cell.itemLabel.text = item.name

        return cell
    }



    
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
