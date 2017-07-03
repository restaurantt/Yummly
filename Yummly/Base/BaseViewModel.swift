//
//  BaseViewModel.swift
//  News
//
//  Created by Gu Jiajun on 2017/6/15.
//  Copyright © 2017年 gjj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class BaseViewModel: NSObject {
    
    let provider = RxMoyaProvider<YummlyAPI>()
    let params = ["_app_id":"69fe9854","_app_key":"ff9d7e12981b7fa6a5889ebb1d5785cf"]

    func aaaaa() {
        
        provider.request(.searchRecipes(params)).subscribe { event in
            switch event {
            case let .next(response):
                print(response)
            case let .error(error):
                print(error)
            default:
                break
            }
        }
    }
    
    
    func testRequest() -> Observable<BaseModel> {
        
        return provider.request(.searchRecipes(params))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapObject(type: BaseModel.self)
    }
}
