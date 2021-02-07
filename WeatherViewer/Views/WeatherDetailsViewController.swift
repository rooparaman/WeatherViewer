// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit

class WeatherDetailsViewController: UITableViewController {
  var viewModel: WeatherDetailViewModel!
  private var weatherLabels : [String] = []
  private var weatherValues : [String] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    
    weatherLabels = viewModel.propertyArray
    viewModel.fetchWeatherDeatil(for: viewModel.cityId, lat: viewModel.lat, lng: viewModel.lng)
    
    viewModel.valueArray.bind {[weak self] (values) in
      self?.weatherValues = values
      self?.reloadDetailsTable()
    }
    
    viewModel.cityName.bind { (name) in
      DispatchQueue.main.async {
        self.navigationItem.title = name
      }
    }
    
    self.navigationItem.backButtonTitle = ""
  }
  
  private func reloadDetailsTable(){
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weatherValues.count
  }
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.weatherDetailCellIdentifier, for: indexPath) as! WeatherDetailViewCell
    cell.configure(parameter: weatherLabels[indexPath.row], value: weatherValues[indexPath.row])
   
   return cell
   }
  
}
