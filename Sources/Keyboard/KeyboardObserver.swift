import UIKit

public class KeyboardObserver: NSObject {
    private let handler: KeyboardHandler

    public required init(handler: KeyboardHandler) {
        self.handler = handler
        super.init()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    public func activate() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    public func deactivate() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let info = KeyboardInfo(notification: notification) else { return }
        handler.willShow(info)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let info = KeyboardInfo(notification: notification) else { return }
        handler.willHide(info)
    }
}
