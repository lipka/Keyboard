import UIKit

public class InsetKeyboardHandler: KeyboardHandler {
    public weak var scrollView: UIScrollView?
    private var originalContentInset = UIEdgeInsets.zero
    private var originalScrollIndicatorInsets = UIEdgeInsets.zero

    public init() {}

    public convenience init(scrollView: UIScrollView) {
        self.init()
        self.scrollView = scrollView
    }

    public func willShow(_ info: KeyboardInfo) {
        originalContentInset = scrollView?.contentInset ?? .zero
        originalScrollIndicatorInsets = scrollView?.scrollIndicatorInsets ?? .zero

        var contentInset = originalContentInset
        contentInset.bottom += info.height

        var scrollIndicatorInsets = originalScrollIndicatorInsets
        scrollIndicatorInsets.bottom += info.height

        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.scrollView?.contentInset = contentInset
            self?.scrollView?.scrollIndicatorInsets = scrollIndicatorInsets
            }, completion: nil)
    }

    public func willHide(_ info: KeyboardInfo) {
        let contentInset = originalContentInset
        let scrollIndicatorInsets = originalScrollIndicatorInsets

        UIView.animate(withDuration: info.duration, delay: 0, options: info.animationOptions, animations: { [weak self] in
            self?.scrollView?.contentInset = contentInset
            self?.scrollView?.scrollIndicatorInsets = scrollIndicatorInsets
            }, completion: nil)
    }
}
