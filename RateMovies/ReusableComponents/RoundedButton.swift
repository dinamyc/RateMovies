//
//  RoundedButton.swift
//  RateMovies
//
//

import UIKit

class RoundedButton: UIButton {

    @IBOutlet private var contentView: UIView!
 
    var buttonBackgroundColor: UIColor? {
        set {
            contentView.backgroundColor = newValue
        }
        get {
            contentView.backgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var isHighlighted: Bool {
      didSet {
        if oldValue != isHighlighted {
          updateAppearance()
        }
      }
    }

    override var isEnabled: Bool {
      didSet {
        if oldValue != isEnabled {
          updateAppearance()
        }
      }
    }

    override var isSelected: Bool {
      didSet {
        if oldValue != isSelected {
          updateAppearance()
        }
      }
    }
}

private extension RoundedButton {
    func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed("RoundedButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = self.bounds
        contentView.isUserInteractionEnabled = false
        contentView.layer.cornerRadius = self.bounds.height / 2
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 1)
        contentView.layer.shadowRadius = 5
        setTitleColor(.white, for: .normal)
        setTitleColor(.green, for: .disabled)
    }
    
    func updateAppearance() {
        
        guard isEnabled else {
            contentView.backgroundColor = UIColor.base600
            contentView.layer.shadowColor = UIColor.clear.cgColor
            return
        }
        contentView.backgroundColor = UIColor.base600

        if isSelected || isHighlighted {
            contentView.layer.shadowColor = UIColor.clear.cgColor
        } else {
            contentView.layer.shadowColor = UIColor.black.cgColor
        }
    }
}
