//
//  ViewController.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
//    var dreamLists = [DreamList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self
        
        ManageData.instance.loadDreamLists()
        
//        let dreamList1: DreamList = DreamList(detail: "1", imageName: "")
//        let dreamList2: DreamList = DreamList(detail: "2", imageName: "")
//        let dreamList3: DreamList = DreamList(detail: "3", imageName: "")
//        let dreamList4: DreamList = DreamList(detail: "4", imageName: "")
//        let dreamList5: DreamList = DreamList(detail: "5", imageName: "")
//
//        dreamLists.append(dreamList1)
//        dreamLists.append(dreamList2)
//        dreamLists.append(dreamList3)
//        dreamLists.append(dreamList4)
//        dreamLists.append(dreamList5)
        
//        self.tableView.rowHeight = CGFloat((arc4random() % UInt32(500)) + 100)
        
        let cellHeight = tableView.frame.width + 90
        self.tableView.rowHeight = cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dreamLists.count
        return ManageData.instance.myDreamLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let dreamList = dreamLists[indexPath.row]
        let dreamList = ManageData.instance.myDreamLists[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DreamListTableViewCell") as? DreamListTableViewCell {
            cell.setData(dreamList: dreamList)
            return cell
        } else {
            let cell = DreamListTableViewCell()
            cell.setData(dreamList: dreamList)
            return cell
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

