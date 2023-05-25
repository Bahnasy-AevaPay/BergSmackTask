//
//  ViewController.swift
//  BergSmack
//
//  Created by Joshua Williams on 5/22/23.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import UIKit

protocol MealsListVCProtocol: AnyObject{
    func reloadTableView()
    func showLoader()
    func hideLoader()
}
class MealsListVC: UIViewController {
    // MARK: - Properties
    var viewModel: MealsListVMProtocol!
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
}
//MARK: Life Cycle
extension MealsListVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        viewModel.initFetchMealsList()
    }
    
}

//MARK: ViewModel notify ViewCotnroller
extension MealsListVC: MealsListVCProtocol{
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
        self.view.hideLoader()
    }
    
}
//MARK: TableView Delegation
extension MealsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getItemsCount()//return the count of cell for tableview
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.ID, for: indexPath) as? MealTableViewCell else {return UITableViewCell()}
        self.viewModel.configureMealCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapCell(at: indexPath)
    }
}

//MARK: Helpers
extension MealsListVC{
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: MealTableViewCell.ID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealTableViewCell.ID)
    }
}
