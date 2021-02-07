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
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return weatherValues.count
  }
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.weatherDetailCellIdentifier, for: indexPath) as! WeatherDetailViewCell
    cell.configure(parameter: weatherLabels[indexPath.row], value: weatherValues[indexPath.row])
   
   return cell
   }
   
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
