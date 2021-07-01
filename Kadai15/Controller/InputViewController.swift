//
//  InputViewController.swift
//  Kadai15
//
//  Created by 今村京平 on 2021/07/01.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!

    var saveText: (String) -> Void = { _ in }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
    }

    @IBAction private func tappedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func tappedSave(_ sender: Any) {
        guard nameTextField.text != "" else {
            presentNotInputAlert()
            return
        }
        saveText(nameTextField.text!)
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func tappedView(_ sender: Any) {
        view.endEditing(true)
    }

    private func presentNotInputAlert() {
        let alert = UIAlertController(
            title: "名前が未入力です",
            message: "名前を入力して下さい",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }
}
