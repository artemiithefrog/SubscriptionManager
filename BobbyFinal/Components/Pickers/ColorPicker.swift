//
//  ColorPicker.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 18.10.2023.
//

import UIKit
import SwiftUI

struct ColorPickerViewController: UIViewControllerRepresentable {
    class Coordinator: NSObject, UIColorPickerViewControllerDelegate {
        var parent: ColorPickerViewController

        init(parent: ColorPickerViewController) {
            self.parent = parent
        }

        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            parent.selectedColor = viewController.selectedColor
        }

        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Binding var selectedColor: UIColor
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white

        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = context.coordinator
        viewController.addChild(colorPicker)
        viewController.view.addSubview(colorPicker.view)

        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.addTarget(context.coordinator, action: #selector(Coordinator.colorPickerViewControllerDidFinish), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            colorPicker.view.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            colorPicker.view.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            colorPicker.view.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            colorPicker.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            closeButton.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -16)
        ])

        colorPicker.didMove(toParent: viewController)

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the UI if needed
    }
}
