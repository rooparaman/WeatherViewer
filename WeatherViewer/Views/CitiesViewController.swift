// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit
import CoreLocation
class CitiesViewController: UIViewController {
  @IBOutlet weak var citiesTableView : UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var currentLocButton: UIButton!
  
  private var cities: [CityModel] = []
  private var searchedCities: [CityModel] = []
  private var isSearching = false
  private var viewModel = CitiesViewModel()
  private let locationManager = CLLocationManager()
  private var currentLocationCoordinates: CLLocationCoordinate2D?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      locationManager.delegate = self
      locationManager.requestWhenInUseAuthorization()
      locationManager.requestLocation()
      
      
      self.citiesTableView.delegate = self
      self.citiesTableView.dataSource = self
      self.searchBar.delegate = self
        // Do any additional setup after loading the view.
      
      
      viewModel.cities.bind {[weak self] (cities) in
        guard let self = self else { return }
        self.cities = cities
        self.reloadTable()
      }
      
      viewModel.getCities()
      
    }
  
  private func reloadTable() {
    DispatchQueue.main.async {
      self.citiesTableView.reloadData()
    }
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

extension CitiesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
      var selectedCity = isSearching ? searchedCities[indexPath.row] : cities[indexPath.row]
      // Close keyboard when you select cell
      self.searchBar.searchTextField.endEditing(true)
      if selectedCity.id == Constants.currentLocationId {
        selectedCity.lattitude = currentLocationCoordinates?.latitude
        selectedCity.longitude = currentLocationCoordinates?.longitude
        dismissCurrentView(with: selectedCity)
      }else{
        dismissCurrentView(with: selectedCity)
      }
  }
  
  private func dismissCurrentView(with city:CityModel){
    if let presenter = presentingViewController?.children[0] as? WeatherViewController {
      let i = presenter.viewModel.cities.value.firstIndex(where: { $0.id == city.id }) ?? -1
      if (i < 0) {
        presenter.viewModel.cities.value.append(city)
      }
    }
    dismiss(animated: true, completion: nil)
  }
}

extension CitiesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isSearching {
      return searchedCities.count
    } else {
      return cities.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")
    if isSearching {
      cell?.textLabel?.text = searchedCities[indexPath.row].name
    } else {
      cell?.textLabel?.text = cities[indexPath.row].name
    }
    
    return cell!
  }
  
  
}

extension CitiesViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    searchedCities = cities.filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() }
        isSearching = true
        citiesTableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    isSearching = false
    searchBar.text = ""
    citiesTableView.reloadData()
  }
}

extension CitiesViewController: CLLocationManagerDelegate {
    
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if ((manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse)) {
      cities.insert(CityModel(id: Constants.currentLocationId, name: "My Location", lattitude: self.currentLocationCoordinates?.latitude ?? 0, longitude: self.currentLocationCoordinates?.latitude ?? 0), at: 0)
      DispatchQueue.main.async {
        self.citiesTableView.reloadData()
      }
      
    }else {
      cities = cities.filter {
        $0.id != Constants.currentLocationId
      }
    }
  }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            self.currentLocationCoordinates = location.coordinate
            
            print(location.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


