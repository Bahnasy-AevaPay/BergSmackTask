//
//  MealDetailsVC.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import UIKit

protocol MealDetailsVCProtocol: AnyObject{
    func showLoader()
    func hideLoader()
    func setup(image: String, name: String, instructions: String, ingreadients: String)
}
class MealDetailsVC: UIViewController {

    // MARK: Properties
    var viewModel: MealDetailsVMProtocol!
    
    //MARK: Outlets
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
}

//MARK: Life Cycle
extension MealDetailsVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.initFetchMealDetails()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.finishPreviewingDetails()
    }
}

//MARK: ViewModel notify ViewCotnroller
extension MealDetailsVC: MealDetailsVCProtocol{
    func showLoader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
        self.view.hideLoader()
    }
    
    func setup(image: String, name: String, instructions: String, ingreadients: String) {
        self.mealImageView.load(url: URL(string: image)!)
        self.navigationItem.title = name
        self.instructionsLabel.text = instructions
        self.ingredientsLabel.text = ingreadients
    }
}
