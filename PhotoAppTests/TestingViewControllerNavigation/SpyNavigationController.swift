//
//  SpyNavigationController.swift
//  PhotoAppTests
//
//  Created by Macintosh on 27.03.2022.
//

import UIKit

class SpyNavigationController:UINavigationController{
    var pushedViewController: UIViewController!
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        //so thats way we can capture which viewController is pushed to navigation
        pushedViewController = viewController
    }
}
