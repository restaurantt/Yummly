//
//  BaseModel.swift
//  News
//
//  Created by Gu Jiajun on 2017/6/15.
//  Copyright © 2017年 gjj. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: Mappable {
    var totalMatchCount: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        totalMatchCount <- map["totalMatchCount"]

    }
}
