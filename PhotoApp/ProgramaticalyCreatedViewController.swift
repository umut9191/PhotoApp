//
//  ProgramaticalyCreatedViewController.swift
//  PhotoApp
//
//  Created by Macintosh on 24.03.2022.
//

import UIKit

class ProgramaticalyCreatedViewController: UIViewController {
//This view controller created as well as XIBBaseViewController the differance when created cocoa touch class to anable created XIB file
    //We add this code manuelly;
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
