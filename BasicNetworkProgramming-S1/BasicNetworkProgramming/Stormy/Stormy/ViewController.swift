//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate let darkSkyApiKey = "adf6d57e36957e779d7db8b6585efef9"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "Hot!", icon: "clear-day")
        let currentWeatherViewModel = CurrentWeatherViewModel(model: currentWeather)
        
        displayWeather(using: currentWeatherViewModel)
        
        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
        guard let forecastUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else { return }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let request = URLRequest(url: forecastUrl)
        
        print("Log before request on main thread")
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            print("Log inside completion handler")
        }
        
        dataTask.resume()
        
        print("Log after resume")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
}
















