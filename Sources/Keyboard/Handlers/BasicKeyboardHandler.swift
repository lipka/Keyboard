import UIKit

public class BasicKeyboardHandler: KeyboardHandler {
    public var show: ((_ height: CGFloat) -> Void)?
    public var hide: (() -> Void)?

    public init() {}

    public func willShow(_ info: KeyboardInfo) {
        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.show?(info.height)
            }, completion: nil)
    }

    public func willHide(_ info: KeyboardInfo) {
        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.hide?()
            }, completion: nil)
    }
}
