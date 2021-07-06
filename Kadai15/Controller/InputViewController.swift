//
//  InputViewController.swift
//  Kadai15
//
//  Created by 今村京平 on 2021/07/01.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!

//    var saveText: (String) -> Void = { _ in }
    // .instantiateInitialViewController(creator:) を使ったことで、letにできている
    private let saveText: (String) -> Void

    // インスタンス化メソッドを作って、そこでクロージャーに値を渡すようにする
    static func instantiate(saveText: @escaping (String) -> Void) -> InputViewController {

        UIStoryboard(name: "Input", bundle: nil)
            .instantiateInitialViewController(creator: { coder in
                InputViewController(coder: coder, saveText: saveText)
            })!
    }

    init?(coder: NSCoder, saveText: @escaping (String) -> Void) {
        self.saveText = saveText
        super.init(coder: coder)
    }

    // 失敗可能イニシャライザを記述すると、警告がでて追加される
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
