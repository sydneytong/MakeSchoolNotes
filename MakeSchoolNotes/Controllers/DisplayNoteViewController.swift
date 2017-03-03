//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    var note: Note?

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1
        if let note = note {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "Save", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "Save" {
            if let note = note {
                // 1
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                // 2
                listNotesTableViewController.tableView.reloadData()
            } else {
                // 3
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                newNote.modificationTime = Date()
                listNotesTableViewController.notes.append(newNote)
            }
        }
    }
    
   
}
