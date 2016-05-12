//
//  SongListTableViewController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedPlaylist = playlist {
            self.title = unwrappedPlaylist.name
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let title = titleTextField.text, let artist = artistTextField.text, let playlist = playlist {
            SongController.createSong(title, artist: artist, playlist: playlist)
            tableView.reloadData()
            titleTextField.text = ""
            artistTextField.text = ""
        }
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
