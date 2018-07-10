//
//  ManageData.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import Foundation
import UIKit

class ManageData {
    static let instance = ManageData()
    
    let DREAMLIST_KEY = "DreamLists"
    
    private var _myDreamLists = [DreamList]()
    
    var myDreamLists: [DreamList] {
        return _myDreamLists
    }
    
    func loadDreamLists() {
        if let dreamListData = UserDefaults.standard.object(forKey: DREAMLIST_KEY) as? Data {
            if let dreamListArray = NSKeyedUnarchiver.unarchiveObject(with: dreamListData) as? [DreamList] {
                _myDreamLists = dreamListArray
            }
        }
    }
    
    func saveDreamLists() {
        let dreamListData = NSKeyedArchiver.archivedData(withRootObject: _myDreamLists)
        UserDefaults.standard.set(dreamListData, forKey: DREAMLIST_KEY)
        UserDefaults.standard.synchronize()
    }
    
    func saveImageToFile(image: UIImage) -> String {
        let imgName = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        if let imgData = UIImagePNGRepresentation(image) {
//            let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            let fullPath = getDocumentDirectory().str
            let imgUrl = getDocumentDirectory().appendingPathComponent(imgName)
            try! imgData.write(to: imgUrl)
        }
        return imgName
    }
    
    func getDocumentDirectory() -> URL {
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let paths = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let documentDirectory = paths
        
        return documentDirectory
    }
    
    func addDreamList(dreamList: DreamList) {
        _myDreamLists.append(dreamList)
        saveDreamLists()
        loadDreamLists()
    }
}
