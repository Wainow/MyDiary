//
//  Alert.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 26.07.2021.
//

import Foundation
import UIKit
import SwiftUI

class MyAlert{
    func getTagAlert(result: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Tag", message: nil, preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Write here your tag"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        alert.addAction(UIAlertAction(title: "Done", style: .default) { _ in
            result(alert.textFields?.first?.text ?? "")
        })
        showAlert(alert: alert)
    }
    
    func getDeleteAlert(result: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Are you sure want to delete all notes?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Сancel", style: .cancel) { _ in
            result(false)
        })
        alert.addAction(UIAlertAction(title: "Delete", style: .default) { _ in
            result(true)
        })
        showAlert(alert: alert)
    }

    func showAlert(alert: UIAlertController) {
        if let controller = topMostViewController() {
            controller.present(alert, animated: true)
        }
    }

    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
    }

    private func topMostViewController() -> UIViewController? {
        guard let rootController = keyWindow()?.rootViewController else {
            return nil
        }
        return topMostViewController(for: rootController)
    }

    private func topMostViewController(for controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return topMostViewController(for: presentedController)
        } else if let navigationController = controller as? UINavigationController {
            guard let topController = navigationController.topViewController else {
                return navigationController
            }
            return topMostViewController(for: topController)
        } else if let tabController = controller as? UITabBarController {
            guard let topController = tabController.selectedViewController else {
                return tabController
            }
            return topMostViewController(for: topController)
        }
        return controller
    }
}
