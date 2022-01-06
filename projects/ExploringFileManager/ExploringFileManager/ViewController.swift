//
//  ViewController.swift
//  ExploringFileManager
//
//  Created by Tan Ren Jie on 3/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        
        // Get Path to Document Directory
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        print(url.path)
        
        // Create Directory
        let newFolderUrl = url.appendingPathComponent("ios-acdemy")
        do {
            try manager.createDirectory(at: newFolderUrl, withIntermediateDirectories: false, attributes: [:])
        } catch {
            print(error)
        }
        
        // Create File
        let fileUrl = newFolderUrl.appendingPathComponent("logs.txt")
        manager.createFile(atPath: fileUrl.path, contents: nil, attributes: [FileAttributeKey.creationDate: Date()])
        
        // Delete File
        if manager.fileExists(atPath: fileUrl.path) {
            do {
                try manager.removeItem(at: fileUrl)
            } catch {
                print(error)
            }
        }
    }


}

