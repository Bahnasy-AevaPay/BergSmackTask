//
//  MealDetailsVC.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import UIKit

class MealDetailsVC: UIViewController {

    // MARK:- Properties
    var viewModel: MealDetailsVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.finishPreviewingDetails()
    }

}
