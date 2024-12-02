//
//  extension+UIview.swift
//  glycemic
//
//  Created by EMP on 11/10/2023.
//

import Foundation
import UIKit

class EmptyDataView: UIView {
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "No Data Available"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
