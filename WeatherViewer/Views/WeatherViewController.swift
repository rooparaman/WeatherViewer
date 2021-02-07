// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit

class WeatherViewController: UITableViewController {

  var viewModel: WeatherViewModel = WeatherViewModel()
  private var cityWeatherItems : [WeatherModel] = []
  private var cities: [CityModel] = []
  private var fetchTimer: Timer?
  private var selectedCity: CityModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.cities.bind {[weak self] (cities) in
      guard let self = self else { return }
      self.cities = cities
      self.reloadTable()
    }
    viewModel.getDefaultCities()
    
  }
  
  private func reloadTable(){
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  @objc func runTimedFetch() {
    reloadTable()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if fetchTimer == nil {
      fetchTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(runTimedFetch), userInfo: nil, repeats: true)
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    fetchTimer?.invalidate()
    fetchTimer = nil
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return cities.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cityCellIdentifier, for: indexPath) as! CityWeatherCell
    
    cell.configure(city: cities[indexPath.row])
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedCity = cities[indexPath.row]
    performSegue(withIdentifier: Constants.detailSegueIdentifier, sender: nil)
  }
  
  
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.detailSegueIdentifier {
      if let destinationVC = segue.destination as? WeatherDetailsViewController{
        destinationVC.viewModel = WeatherDetailViewModel(city: selectedCity!)
      }
    }
   }
   
  
}
