//
//  UIKitExtensions
//  ASCommon
//
//  Created by Andrea on 07/02/2018.
//

import Foundation

public extension UINavigationController {

    /// Push the view controller with fade animation
    ///
    /// - Parameters:
    ///   - viewController: The view controller
    ///   - animationDuration: The animation duration (default 0.3)
    func pushFadeViewController(viewController: UIViewController, duration: CFTimeInterval = 0.2, type: String = kCATransitionFade) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        self.view.layer.add(transition, forKey: nil)
        self.pushViewController(viewController, animated: false)
    }

    /// Pop the view controller with fade animation
    ///
    /// - Parameters:
    ///   - animationDuration: The animation duration (default 0.3)
    func popFadeViewController(duration: CFTimeInterval = 0.2, type: String = kCATransitionFade) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        self.view.layer.add(transition, forKey: nil)
        self.popViewController(animated: false)
    }
}

public extension UIScrollView {

    /// Current device orientation
    var currentDeviceOrientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    /// Current device orientation
    var currentOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

    /// Current device orientation
    var currentScreen: UIScreen {
        return UIScreen.main
    }
}

public extension UIViewController {

    /// Current device orientation
    var currentDeviceOrientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    /// Current device orientation
    var currentOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

    /// Current device orientation
    var currentScreen: UIScreen {
        return UIScreen.main
    }

    /// The storyboard identifier for the controller
    static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }

    /// The view controller is current visibile
    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }

    /// Add a child view controller
    ///
    /// - Parameter child: The child view controller
    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    /// Remove the view controller from the parent
    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }

    /// Instanciate a view controller. Set the Storyboard ID for each scene in your storyboard to the class name of the View Controller
    ///
    /// - Parameter storyboardName: The storyboard name
    /// - Returns: The controller
    class func instantiateFromStoryboard<T: UIViewController>(_ storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }

    /// Get a view controller from a storyboard
    ///
    /// - Parameters:
    ///   - storyboard: The storyboard name
    ///   - controllerId: The optional controller id
    /// - Returns: The view controller
    static func getControllerFromStoryboard(_ storyboard: String, controllerId: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        guard let controllerId = controllerId else {
            return storyboard.instantiateInitialViewController()!
        }
        return storyboard.instantiateViewController(withIdentifier: controllerId)
    }
}

extension UIImage {

    /// Image aspect ratio
    var aspectRatio: CGFloat {
        return size.width / size.height
    }
}

extension UIGestureRecognizer {

    /// Cancel a gesture
    func cancel() {
        isEnabled = false
        isEnabled = true
    }
}
