//
//  GyroscopeViewController.swift
//  RxCoreMotion_Example
//
//  Created by Carlos García on 23/05/16.
//  Copyright © 2016 RxSwiftCommunity - https://github.com/RxSwiftCommunity. All rights reserved.
//

import UIKit
import RxSwift
import CoreMotion
import RxCoreMotion

class GyroscopeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let coreMotionManager = RxCoreMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        coreMotionManager.rotationRate
            .observeOn(MainScheduler.instance)
            .subscribeNext { [weak self] rotationRate in
                print(self)
                print(rotationRate)
            }
            .addDisposableTo(disposeBag)
        
    }

}
