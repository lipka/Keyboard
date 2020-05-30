import UIKit

public class ConstraintKeyboardHandler: KeyboardHandler {
    public var constraint: NSLayoutConstraint?
    public weak var view: UIView?

    public convenience init(constraint: NSLayoutConstraint, view: UIView) {
        self.init()
        self.constraint = constraint
        self.view = view
    }

    public func willShow(_ info: KeyboardInfo) {
        constraint?.constant = -info.height
        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.view?.layoutIfNeeded()
            }, completion: nil)
    }

    public func willHide(_ info: KeyboardInfo) {
        constraint?.constant = 0
        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.view?.layoutIfNeeded()
            }, completion: nil)
    }
}
