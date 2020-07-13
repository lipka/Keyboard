import UIKit

public class CustomKeyboardHandler: KeyboardHandler {
    public var show: ((_ info: KeyboardInfo) -> Void)?
    public var hide: ((_ info: KeyboardInfo) -> Void)?

    public init() {}

    public func willShow(_ info: KeyboardInfo) {
        show?(info)
    }

    public func willHide(_ info: KeyboardInfo) {
        hide?(info)
    }
}
