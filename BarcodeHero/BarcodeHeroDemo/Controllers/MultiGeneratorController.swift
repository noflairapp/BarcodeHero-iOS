//
//  MultiGeneratorController.swift
//  BarcodeHeroDemo
//
//  Created by Brian Drelling on 11/5/17.
//  Copyright © 2017 SpotHero. All rights reserved.
//

import AVFoundation
import BarcodeHero
import Foundation
import UIKit

class MultiGeneratorController: UITableViewController {
    // MARK: - Properties

    @IBOutlet weak var dataTextField: UITextField?

    @IBOutlet var barcodeImageViewWidthConstraint: NSLayoutConstraint?

    private var data: String = "12345678"
    private var types: [BHBarcodeType] = BHBarcodeType.asArray

    // MARK: - Methods

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
    }

    // MARK: Overrides (UITableView)

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BarcodeCell",
                                                       for: indexPath) as? BarcodeCell else {
                                                        return UITableViewCell()
        }

        let type = types[indexPath.row]

        cell.load(type, withData: data)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let type = types[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }

    // MARK: Utilities

    private func generateBarcodes() {
        
    }
}

// MARK: - Extensions

extension MultiGeneratorController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)

        return true
    }
}

//extension MultiGeneratorController: BarcodeTypesControllerDelegate {
//    func didSelectType(type: BHBarcodeType) {
//        self.type = type
//
//        typeLabel?.text = type.rawValue
//
//        regenerateBarcode()
//
//        navigationController?.popToViewController(self, animated: true)
//    }
//}

