//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "New Playlist", message: "Create a new playlist", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Playlist name"
        }
        let createAction = UIAlertAction(title: "Create", style: .Default) { (_) in
            guard let textFields = alertController.textFields, firstTextField = textFields.first, playlistName = firstTextField.text else {
                return
            }
            PlaylistController.sharedInstance.addPlaylist(playlistName)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PlaylistController.sharedInstance.playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlists"
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSongList", let songListTVC = segue.destinationViewController as? SongListTableViewController, let playlistCell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(playlistCell) {
            songListTVC.playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        }
    }
}




/*
 • if segue.identifier == "toSongList" 
    check that you have right segue identifier
 • let songListTVC = segue.destinationViewController as? SongListTableViewController
    state the destination of the segue, segue.destinationViewController is going to SongListTableViewController (as? = cast)
 • let playlistCell = sender as? UITableViewCell
    cast playlistcell as a uitableviewcell, parameters in func is set as anyobject, must declare that it is a cell
 • let indexPath = tableView.indexPathForCell(playlistCell)
    create constant of indexpath to retrieve the indexpath of the cell
 • songListTVC.playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
    property of playlist, grab the specific playlist
 */








