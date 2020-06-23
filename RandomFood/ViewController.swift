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
        Food(name: "🍌 Banana", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🍎 Apple", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🥩 Steak", spicy: false, type: .us, budge: .expensive),
        Food(name: "🍲 HotPot", spicy: true, type: .ch, budge: .expensive),
        Food(name: "👨🏼‍🍳 Uncle Shawn", spicy: true, type: .jp, budge: .expensive),
        Food(name: "🐓 KFC", spicy: false, type: .us, budge: .cheap),
        Food(name: "🇰🇷 Kimchi Cake", spicy: true, type: .kr, budge: .normal),
        Food(name: "🍝 Dry Noodle", spicy: true, type: .ch, budge: .cheap),
        Food(name: "🍜 Fried Instant Noodle", spicy: true, type: .thai, budge: .normal),
        Food(name: "🍔 Hamburger", spicy: false, type: .us, budge: .cheap),
        Food(name: "🍗 Fried Chicken", spicy: false, type: .us, budge: .cheap),
        Food(name: "🍟 French Fries", spicy: false, type: .us, budge: .cheap),
        Food(name: "🍣 Sushi", spicy: false, type: .jp, budge: .expensive),
        Food(name: "🍳 Egg", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🧀 Cheese", spicy: false, type: .undefined, budge: .normal),
        Food(name: "🌯 Taco", spicy: true, type: .us, budge: .cheap),
        Food(name: "🍖 BBQ", spicy: false, type: .undefined, budge: .expensive),
        Food(name: "🍋 Lime", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🥗 Salad", spicy: false, type: .us, budge: .cheap),
        Food(name: "🍿 Popcorn", spicy: false, type: .us, budge: .cheap),
        Food(name: "🍞 Toast", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🍦 Ice Cream", spicy: false, type: .us, budge: .cheap),
        Food(name: "🥝 Kiwi", spicy: false, type: .undefined, budge: .cheap),
        Food(name: "🍰 Cake", spicy: false, type: .us, budge: .normal),
        Food(name: "🍪 Cookie", spicy: false, type: .us, budge: .cheap)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
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

