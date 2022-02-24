//
//  CustomPicture.swift
//  NeVK
//
//  Created by Mikhail Papullo on 12/8/21.
//

import UIKit

@IBDesignable class CustomPicture: BounceImage {

    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }

    private var imageView: UIImageView = UIImageView()
    private var containaerView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupImage()
    }

    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.updateColor()
        }
    }

    @IBInspectable var shadowOpacity: Float = 3.0 {
        didSet {
            self.updateOpacity()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.updateRadius()
        }
    }

    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.updateOffset()
        }
    }

    private func setupImage() {
        containaerView.frame = self.bounds
        containaerView.layer.cornerRadius = 35

        imageView.layer.masksToBounds = true
        imageView.frame = containaerView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.image = image

        containaerView.addSubview(imageView)
        self.addSubview(containaerView)
        updateShadows()
    }

    private func updateOpacity() {
        self.containaerView.layer.shadowOpacity = shadowOpacity
    }

    private func updateColor() {
        self.containaerView.layer.shadowColor = shadowColor.cgColor
    }

    private func updateOffset() {
        self.containaerView.layer.shadowOffset = shadowOffset
    }

    private func updateRadius() {
        self.containaerView.layer.shadowRadius = shadowRadius
    }

    private func updateShadows() {
        self.containaerView.layer.shadowOpacity = shadowOpacity
        self.containaerView.layer.shadowRadius = shadowRadius
        self.containaerView.layer.shadowColor = shadowColor.cgColor
        self.containaerView.layer.shadowOffset = shadowOffset
    }
}

