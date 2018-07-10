//
//  DreamList.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import Foundation

class DreamList: NSObject, NSCoding {
    private var _detail: String!
    private var _imageName: String!
    
    var detail: String{
        return _detail
    }
    
    var imageName: String {
        return _imageName
    }
    
    init(detail: String, imageName:String) {
        self._detail = detail
        self._imageName = imageName
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._detail = aDecoder.decodeObject(forKey: "detail") as? String
        self._imageName = aDecoder.decodeObject(forKey: "imageName") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._detail, forKey: "detail")
        aCoder.encode(self._imageName, forKey: "imageName")
    }
}
