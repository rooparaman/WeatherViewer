// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit

class CityWeatherCell: UITableViewCell {
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  
  private var viewModel : CityWeatherViewModel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configure(city:CityModel){
    self.viewModel = CityWeatherViewModel(name: city.name, id: city.id)
    
    self.cityLabel.text = viewModel.cityName
    viewModel.fetchWeather(cityId: viewModel.cityId)
    viewModel.temperature.bind {[weak self] (temp) in
      DispatchQueue.main.async {
        self?.tempLabel.text = temp
      }
    }
    
    
  }
  
}
