//
//  MealTableViewCell.swift
//  BergSmack
//
//  Created by Geddawy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    static let ID = "MealTableViewCell"
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func bind(meal: Meal){
        self.mealLabel.text = meal.strMeal
        self.mealImageView.load(url: URL(string: meal.strMealThumb ?? "")!)
    }
}
