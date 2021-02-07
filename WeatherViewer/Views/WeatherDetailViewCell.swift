// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit

class WeatherDetailViewCell: UITableViewCell {
  @IBOutlet weak var weatherParameterLabel: UILabel!
  @IBOutlet weak var weatherValueLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configure(parameter:String,value:String){
    self.weatherValueLabel.text = value
    self.weatherParameterLabel.text = parameter
  }
  
  

}
