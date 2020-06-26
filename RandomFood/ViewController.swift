//
//  ViewController.swift
//  RandomFood
//
//  Created by Aries Yang on 2020/6/24.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = UITableView()

    let foodList: [Food] = [
        Food(name: "1.  🍌 Banana", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "2.  🍎 Apple", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "3.  🥩 Steak", spicy: false, type: .us, budge: .expensive),
        Food(name: "4.  🍲 HotPot", spicy: true, type: .ch, budge: .expensive),
        Food(name: "5.  👨🏼‍🍳 Uncle Shawn", spicy: true, type: .jp, budge: .expensive),
        Food(name: "6.  🐓 KFC", spicy: false, type: .us, budge: .cheap),
        Food(name: "7.  🇰🇷 Kimchi Cake", spicy: true, type: .kr, budge: .normal),
        Food(name: "8.  🍝 Dry Noodle", spicy: true, type: .ch, budge: .cheap),
        Food(name: "9.  🍜 Fried Instant Noodle", spicy: true, type: .thai, budge: .normal),
        Food(name: "10. 🍔 Hamburger", spicy: false, type: .us, budge: .cheap),
        Food(name: "11. 🍗 Fried Chicken", spicy: false, type: .us, budge: .cheap),
        Food(name: "12. 🍟 French Fries", spicy: false, type: .us, budge: .cheap),
        Food(name: "13. 🍣 Sushi", spicy: false, type: .jp, budge: .expensive),
        Food(name: "14. 🍳 Egg", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "15. 🧀 Cheese", spicy: false, type: .undefined, budge: .normal),
        Food(name: "16. 🌯 Taco", spicy: true, type: .us, budge: .cheap),
        Food(name: "17. 🍖 BBQ", spicy: false, type: .undefined, budge: .expensive),
        Food(name: "18. 🍋 Lime", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "19. 🥗 Salad", spicy: false, type: .us, budge: .cheap),
        Food(name: "20. 🍿 Popcorn", spicy: false, type: .us, budge: .cheap),
        Food(name: "21. 🍞 Toast", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "22. 🍦 Ice Cream", spicy: false, type: .us, budge: .cheap),
        Food(name: "23. 🥝 Kiwi", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "24. 🍰 Cake", spicy: false, type: .us, budge: .normal),
        Food(name: "25. 🍪 Cookie", spicy: false, type: .us, budge: .cheap)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.frame.origin.y = UIApplication.shared.statusBarFrame.height
        view.addSubview(tableView)
        tableView.register(FoodCell.self, forCellReuseIdentifier: "\(FoodCell.self)")
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FoodCell.self)", for: indexPath)
        cell.textLabel?.text = foodList[indexPath.row].name
        return cell
    }
}

