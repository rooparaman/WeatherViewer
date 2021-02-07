// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import UIKit

class CitiesViewController: UIViewController {
  @IBOutlet weak var citiesTableView : UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var currentLocButton: UIButton!
  
  private var cities: [CityModel] = []
  private var searchedCities: [CityModel] = []
  private var isSearching = false
  private var viewModel = CitiesViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
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
    let selectedCity = isSearching ? searchedCities[indexPath.row] : cities[indexPath.row]
    // Close keyboard when you select cell
    self.searchBar.searchTextField.endEditing(true)
    
    if let presenter = presentingViewController?.children[0] as? WeatherViewController {
      presenter.viewModel.cities.value.append(selectedCity)
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


