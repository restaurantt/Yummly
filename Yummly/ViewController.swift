//
//  ViewController.swift
//  Yummly
//
//  Created by Gu Jiajun on 2017/6/30.
//  Copyright © 2017年 gjj. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import Moya

import Alamofire

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let provider = MoyaProvider<YummlyAPI>()
//        let params = ["_app_id":"69fe9854","_app_key":"ff9d7e12981b7fa6a5889ebb1d5785cf"]
//        provider.request(.searchRecipes(params)) { result in
//            
//            print(result.description)
//        }
        
        
//        Alamofire.request("https://api.yummly.com/v1/api/recipes?_app_id=69fe9854&_app_key=ff9d7e12981b7fa6a5889ebb1d5785cf").responseJSON { response in
//            debugPrint(response)
//            
//            if let json = response.result.value {
//                print("JSON: \(json)")
//            }
//        }
//        let viewModel = BaseViewModel()
//        //rxrequest()
//        let disposeBag = DisposeBag()
//
//        viewModel.aaaaa()
        
        
//        viewModel.testRequest()
//            .subscribe(onNext: { (model: BaseModel) in
//            print(model)
//        }, onError: { (error) in
//            print(error)
//            
//        }, onCompleted: {
//            print("complete")
//        }) {
//            
//            }.addDisposableTo(disposeBag)
    }

    func rxrequest() {
        let disposeBag = DisposeBag()
        
        
        let provider = RxMoyaProvider<YummlyAPI>()
        let params = ["_app_id":"69fe9854","_app_key":"ff9d7e12981b7fa6a5889ebb1d5785cf"]
        let aa: Observable<BaseModel> = provider.request(.searchRecipes(params))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapObject(type: BaseModel.self)
        
        
        aa.subscribe(onNext: { (model: BaseModel) in
            print(model)
        }, onError: { (error) in
            print(error)
            
        }, onCompleted: {
            print("complete")
        }) {
            
            }.addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

