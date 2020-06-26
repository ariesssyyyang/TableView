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

    var foodList: [Food] = [
        Food(name: "1.  🍌 Banana", spicy: false, type: .undefined, level: .cheap),
        Food(name: "2.  🍎 Apple", spicy: false, type: .undefined, level: .cheap),
        Food(name: "3.  🥩 Steak", spicy: false, type: .us, level: .expensive),
        Food(name: "4.  🍲 HotPot", spicy: true, type: .ch, level: .expensive),
        Food(name: "5.  👨🏼‍🍳 Uncle Shawn", spicy: true, type: .jp, level: .expensive),
        Food(name: "6.  🐓 KFC", spicy: false, type: .us, level: .cheap),
        Food(name: "7.  🇰🇷 Kimchi Cake", spicy: true, type: .kr, level: .normal),
        Food(name: "8.  🍝 Dry Noodle", spicy: true, type: .ch, level: .cheap),
        Food(name: "9.  🍜 Fried Instant Noodle", spicy: true, type: .thai, level: .normal),
        Food(name: "10. 🍔 Hamburger", spicy: false, type: .us, level: .cheap),
        Food(name: "11. 🍗 Fried Chicken", spicy: false, type: .us, level: .cheap),
        Food(name: "12. 🍟 French Fries", spicy: false, type: .us, level: .cheap),
        Food(name: "13. 🍣 Sushi", spicy: false, type: .jp, level: .expensive),
        Food(name: "14. 🍳 Egg", spicy: false, type: .undefined, level: .cheap),
        Food(name: "15. 🧀 Cheese", spicy: false, type: .undefined, level: .normal),
        Food(name: "16. 🌯 Taco", spicy: true, type: .us, level: .cheap),
        Food(name: "17. 🍖 BBQ", spicy: false, type: .undefined, level: .expensive),
        Food(name: "18. 🍋 Lime", spicy: false, type: .undefined, level: .cheap),
        Food(name: "19. 🥗 Salad", spicy: false, type: .us, level: .cheap),
        Food(name: "20. 🍿 Popcorn", spicy: false, type: .us, level: .cheap),
        Food(name: "21. 🍞 Toast", spicy: false, type: .undefined, level: .cheap),
        Food(name: "22. 🍦 Ice Cream", spicy: false, type: .us, level: .cheap),
        Food(name: "23. 🥝 Kiwi", spicy: false, type: .undefined, level: .cheap),
        Food(name: "24. 🍰 Cake", spicy: false, type: .us, level: .normal),
        Food(name: "25. 🍪 Cookie", spicy: false, type: .us, level: .cheap)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Refresh Control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Shuffling")
        tableView.refreshControl = refreshControl

        // MARK: - UI
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.frame.origin.y = UIApplication.shared.statusBarFrame.height
        view.addSubview(tableView)

        // MARK: - Data Source
        tableView.register(FoodCell.self, forCellReuseIdentifier: "\(FoodCell.self)")
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

private extension ViewController {
    @objc func refreshData(_ refreshControl: UIRefreshControl) {
        shuffleFoodList {
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }

    func shuffleFoodList(completion: @escaping () -> Void) {
        foodList.shuffle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: completion)
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

