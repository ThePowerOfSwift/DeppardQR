//
//  File.swift
//  QRMarks
//
//  Created by Harry Wright on 17/02/2017.
//  Copyright © 2017 Off Piste. All rights reserved.
//

import UIKit
import HWCollectionView
import Firebase

class SplashVC: UIViewController, DownloadManagerDelegate {
    
    let identi: [String] = ["toHome", "toLogin"]
    
    var downloader: DownloadManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if AuthManager.isLoggedIn() {
            let uid = User.main.uid ?? AuthManager.uid
            downloader = DownloadManager(uid!, withFIRReference: DataService.Singleton.REF_USERS)
            downloader?.delegate = self
            downloader?.downloadFirebaseUserObjects()
        } else {
            self.performSegue(withIdentifier: self.identi[1], sender: nil)
        }
    }
    
    func downloadManager(didDownload userData: Dictionary<String, AnyObject>, for uid: String) {
        User.main.setup(user: uid, with: userData)
        
        self.performSegue(withIdentifier: self.identi[0], sender: nil)
    }
}
