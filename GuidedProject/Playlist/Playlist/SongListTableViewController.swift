//
//  SongListTableViewController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedPlaylist = playlist {
            self.title = unwrappedPlaylist.name
        }
    }
    
    // MARK: - IBActions
    
    //create alertController in addButtonTapped. addtextfieldwithconfigurationhandler. two actions, create & cancel. unwrap textfields in create to save the new playlist. addPlaylist.reload. add actions, presentview
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "New Song", message: "Add a song to your playlist", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (songTextField) in
            songTextField.placeholder = "Song name"
        }
        alertController.addTextFieldWithConfigurationHandler { (artistTextField) in
            artistTextField.placeholder = "Artist name"
        }
        let addAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let textFields = alertController.textFields, songTextField = textFields.first, songTitle = songTextField.text else {
                return
            }
            let artistTextField = textFields[1]
            guard let artistName = artistTextField.text, playlist = self.playlist else {
                return
            }
            SongController.createSong(songTitle, artist: artistName, playlist: playlist)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlist?.songs.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        
        let song = playlist?.songs[indexPath.row]
        
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Songs"
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let playlist = playlist else {return}
            let song = playlist.songs[indexPath.row]
            PlaylistController.sharedInstance.removeSongFromPlaylist(song, playlist: playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}
