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
    self.viewModel = CityWeatherViewModel(name: city.name, id: city.id, lat: city.lattitude ?? 0, lng: city.longitude ?? 0)
    
    
    viewModel.fetchWeather(cityId: city.id, lat: city.lattitude ?? 0, lng: city.longitude ?? 0)
    viewModel.temperature.bind {[weak self] (temp) in
      DispatchQueue.main.async {
        self?.tempLabel.text = temp
      }
    }
    viewModel.cityName.bind {[weak self] (name) in
      DispatchQueue.main.async {
        self?.cityLabel.text = name
      }
    }
    
  }
  
}
