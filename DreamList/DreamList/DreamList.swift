//
//  DreamList.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import Foundation

class DreamList {
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
}
