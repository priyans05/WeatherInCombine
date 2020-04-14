//
//  ViewController.swift
//  WeatherInCombine
//
//  Created by PRIYANS on 14/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!

    @IBOutlet weak var tempLabel: UILabel!

    private var anyCancellable: AnyCancellable?
    var dependencies: Dependencies!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPublisher()
    }

    private func setUpPublisher() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)

        self.anyCancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }
        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .flatMap {
            self.dependencies.networkServices.fetchWeather(for: $0)
                .catch { _ in Just(Weather.placeholder)}
                .map{$0}
        }
        .sink {
            if let temp = $0.temp {self.tempLabel.text = "\(temp) Ċ"}
            else {self.tempLabel.text = ""}
        }
    }
}



