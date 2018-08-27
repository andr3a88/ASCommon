//
//  Device.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

public extension UIDevice {
    
    /// Is iphone
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// Iphone screen type
    ///
    /// - iPhone35Inch: 3.5 inch
    /// - iPhone4Inch: 4 inch
    /// - iPhone47Inch: 4.7 inch
    /// - iPhone55Inch: 5.5 inch
    /// - iPhone58Inch: 5.8 inch
    /// - unknown: Ipad or any other device (not iphone)
    enum ScreenType: String {
        case iPhone35Inch
        case iPhone4Inch
        case iPhone47Inch
        case iPhone55Inch
        case iPhone58Inch
        case unknown
    }
    
    /// Iphone screen type
    public var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone35Inch
        case 1136:
            return .iPhone4Inch
        case 1334:
            return .iPhone47Inch
        case 2208:
            return .iPhone55Inch
        case 2436:
            return .iPhone58Inch
        default:
            return .unknown
        }
    }
    
    /// Struct on which save keys for extension's new attributes
    fileprivate struct AssociatedKeys {
        static var deviceName = "com.ennovaresearch.deviceName"
    }
    
    /// Static value on which save device name
    public static var deviceName: String? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.deviceName) as? String else {
                return nil
            }
            return value
        }
        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.deviceName, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Model name
    /// Reference: https://www.theiphonewiki.com/wiki/Models
    public static var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9"
        case "iPad6,11", "iPad6,12":                    return "iPad (5th Gen)"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 (2nd Gen)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.)"
            
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
            
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
    /// Check if current device is iPhone4
    public static var isIphone4: Bool {
        return modelName == "iPhone 4s" || modelName == "iPhone 4" || UIDevice.isSimulatorIPhone4
    }
    
    /// Check if current device is iPhone5
    public static var isIphone5: Bool {
        return modelName == "iPhone 5" || modelName == "iPhone 5c" || modelName == "iPhone 5s" || UIDevice.isSimulatorIPhone5
    }
    
    /// Check if current device is iPhone6
    public static var isIphone6: Bool {
        return modelName == "iPhone 6" || UIDevice.isSimulatorIPhone6
    }
    
    /// Check if current device is iPhone6Plus
    public static var isIphone6Plus: Bool {
        return modelName == "iPhone 6 Plus" || UIDevice.isSimulatorIPhone6Plus
    }
    
    /// Check if current device is iPhone7
    public static var isIphone7: Bool {
        return modelName == "iPhone 7" || UIDevice.isSimulatorIPhone7
    }
    
    /// Check if current device is iPhone7plus
    public static var isIphone7Plus: Bool {
        return modelName == "iPhone 7 Plus" || UIDevice.isSimulatorIPhone7Plus
    }
    
    /// Check if current device is iPhone8
    public static var isIphone8: Bool {
        return modelName == "iPhone 8" || UIDevice.isSimulatorIPhone8
    }
    
    /// Check if current device is iPhone8plus
    public static var isIphone8Plus: Bool {
        return modelName == "iPhone 8 Plus" || UIDevice.isSimulatorIPhone8Plus
    }
    
    /// Check if current device is iPhone X
    public static var isIphoneX: Bool {
        return modelName == "iPhone X" || UIDevice.isSimulatorIPhoneX
    }
    
    /// Check if current device is iPas
    public static var isIpad: Bool {
        if UIDevice.current.model.range(of: "iPad") != nil {
            return true
        }
        return false
    }
    
    /// Check if current device is iPhone
    public static var isIphone: Bool {
        return !self.isIpad
    }
    
    /// Check if current device is a Simulator
    static var isSimulator: Bool {
        return self.modelName == "Simulator"
    }
    
    /// Check if current device is iPhone4S (and earlier) relying on screen height
    public static var isSimulatorIPhone4: Bool {
        return UIDevice.isSimulatorWithScreenHeigth(480)
    }
    
    /// Check if current device is iPhone5 relying on screen height
    public static var isSimulatorIPhone5: Bool {
        return UIDevice.isSimulatorWithScreenHeigth(568)
    }
    
    /// Check if current device is iPhone6 relying on screen height
    public static var isSimulatorIPhone6: Bool {
        return UIDevice.isSimulatorWithScreenHeigth(667)
    }
    
    /// Check if current device is iPhone6 Plus relying on screen height
    public static var isSimulatorIPhone6Plus: Bool {
        return UIDevice.isSimulatorWithScreenHeigth(736)
    }
    
    /// Check if current device is iPhone X
    public static var isSimulatorIPhoneX: Bool {
        return UIDevice.isSimulatorWithScreenHeigth(812)
    }
    
    /// Check if current device is iPhone7 relying on screen height (== iphone 6)
    public static var isSimulatorIPhone7: Bool {
        return UIDevice.isSimulatorIPhone6
    }
    
    /// Check if current device is iPhone7 Plus relying on screen height (== iphone 6 plus)
    public static var isSimulatorIPhone7Plus: Bool {
        return UIDevice.isSimulatorIPhone6Plus
    }
    
    /// Check if current device is iPhone8 relying on screen height (== iphone 6)
    public static var isSimulatorIPhone8: Bool {
        return UIDevice.isSimulatorIPhone6
    }
    
    /// Check if current device is iPhone8 Plus relying on screen height (== iphone 6 plus)
    public static var isSimulatorIPhone8Plus: Bool {
        return UIDevice.isSimulatorIPhone6Plus
    }
    
    fileprivate static func isSimulatorWithScreenHeigth(_ heigth: CGFloat) -> Bool {
        let screenSize: CGRect = UIScreen.main.bounds
        return modelName == "Simulator" && screenSize.height == heigth
    }
}
