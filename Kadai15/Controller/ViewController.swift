//
//  ViewController.swift
//  Kadai15
//
//  Created by 今村京平 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var itemTableView: UITableView!

    private enum Fruits {
        static let apple = "りんご"
        static let orange = "みかん"
        static let banana = "バナナ"
        static let pinepple = "パイナップル"
    }

    private var items = [
        Item(name: Fruits.apple, isChecked: false),
        Item(name: Fruits.orange, isChecked: true),
        Item(name: Fruits.banana, isChecked: false),
        Item(name: Fruits.pinepple, isChecked: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        settingItemTableView()
    }

    private func settingItemTableView() {
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.register(ItemTableViewCell.nib,
                               forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    // 保存後に明示的にreloadするようにしたため、viewWillAppearは不要
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        itemTableView.reloadData()
//    }

    @IBAction private func tappedAdd(_ sender: Any) {
//        performSegue(withIdentifier: "Add", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Add" {
//            // swiftlint:disable:next force_cast
//            let nav = segue.destination as! UINavigationController
//            // swiftlint:disable:next force_cast
//            let inputViewController = nav.topViewController as! InputViewController
//            inputViewController.saveText = { [weak self] in
//                self?.items.append(
//                    Item(name: $0, isChecked: false)
//                ) }
//            }
        present(
            UINavigationController(
                rootViewController: InputViewController.instantiate(
                    saveText: { [weak self] in
                        self?.items.append(
                            Item(name: $0, isChecked: false)
                        )
                        self?.itemTableView.reloadData() } // tableViewをreload
                )
            ), animated: true
        )
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isChecked.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.identifier
        ) as! ItemTableViewCell // swiftlint:disable:this force_cast
        cell.configure(item: items[indexPath.row])
        return cell
    }
}
