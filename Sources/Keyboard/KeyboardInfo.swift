import UIKit

public struct KeyboardInfo {
    public let frame: CGRect
    public let duration: TimeInterval
    public let animationCurve: UIView.AnimationCurve

    public init?(notification: Notification) {
        guard let userInfo = (notification as NSNotification).userInfo,
            let frameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
            else { return nil }

        self.frame = frameValue.cgRectValue
        self.duration = duration
        self.animationCurve = UIView.AnimationCurve(rawValue: curve) ?? .linear
    }

    public var height: CGFloat {
        return frame.height
    }

    public var animationOptions: UIView.AnimationOptions {
        switch animationCurve {
        case .easeIn: return .curveEaseIn
        case .easeOut: return .curveEaseOut
        case .easeInOut: return .curveEaseInOut
        default: return UIView.AnimationOptions()
        }
    }
}
