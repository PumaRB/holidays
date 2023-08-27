//
//  ViewController.swift
//  PublicHolidays
//
//  Created by Rimma Katushina on 27/08/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showHolidayButton(_ sender: Any) {
        fetchHoliday()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController {
    private func fetchHoliday() {
        guard let url = URL(string: "https://date.nager.at/api/v2/publicholidays/2020/US") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let holiday = try JSONDecoder().decode([Holiday].self, from: data)
                print(holiday)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
