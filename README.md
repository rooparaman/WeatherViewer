# WeatherViewer

**WeatherViewer** is an universal iOS app to view the current weather details for cities

## Technicalities
- **MVVM** is used as the architectural design pattern
- Boxing technique in swift has been used for data binding between the view and the view models
- The app has been designed to give a consistent user view across all orientations and all devices
- Used Location services to get the current location and also handled changes to location privacy setting 

## Project Structure
- **Helpers** - Common functionality that is used across the project
- **Services** - Contains all the api service related functionality
- **View Models** - Contains classes that acts as VM in the MVVM
- **Views** - The UI presentation logic sits here
- **Data Mappers** - Maps the api data to Model
- **Data Models** - Contains classes that conforms to codable that represent the api data
- **Models** - Contains the actual business models
- **Test** - Contains the unit & UI tests

## Good to have
- Currently a few cities has been taken from the static json file downloaded from openweathermap for the cities list view. It will be good to fetch them from an api
- API key can be stored in a secure way rather than storing the plain string
