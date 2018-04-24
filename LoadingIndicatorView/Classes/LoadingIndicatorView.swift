//
//  LoadingIndicatorView.swift
//  LoadingIndicatorView
//
//  Created by haripal on 4/24/18.
//

import UIKit

open class LoadingIndicatorView: UIView {
    public static let sharedInstance = LoadingIndicatorView()
    var activityCounter = 0
    let indicatorViewTag = 10001
    var indicatorStyle = UIActivityIndicatorViewStyle.white
    
    let viewIndicatorBG = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    open func setIndicatorStyle(indicatorStyle : UIActivityIndicatorViewStyle) {
        self.indicatorStyle = indicatorStyle
        activityIndicator.activityIndicatorViewStyle = indicatorStyle
        if indicatorStyle == .white || indicatorStyle == .gray {
            viewIndicatorBG.frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
        } else {
            viewIndicatorBG.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        }
        setContentInCenter()
    }
    
    func setContentInCenter() {
        viewIndicatorBG.center = (UIApplication.shared.keyWindow?.center)!
        activityIndicator.center = CGPoint(x: viewIndicatorBG.frame.size.width / 2,
                                           y: viewIndicatorBG.frame.size.height / 2)
        
        UIApplication.shared.keyWindow?.bringSubview(toFront: viewIndicatorBG)
    }
    
    open func showHUD() {
        if activityCounter == 0 {
            viewIndicatorBG.backgroundColor = .black
            viewIndicatorBG.alpha = 0.7
            viewIndicatorBG.tag = indicatorViewTag
            viewIndicatorBG.layer.cornerRadius = viewIndicatorBG.frame.size.width / 8
            viewIndicatorBG.layer.masksToBounds = true
            setIndicatorStyle(indicatorStyle: indicatorStyle)
            activityIndicator.startAnimating()
            viewIndicatorBG.addSubview(activityIndicator)
            UIApplication.shared.keyWindow?.addSubview(viewIndicatorBG)
            setContentInCenter()
            
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        if activityCounter < 0 {
            activityCounter = 0
        }
        activityCounter += 1
    }
    
    open func hideHUD() {
        activityCounter -= 1
        setIndicatorStyle(indicatorStyle: .whiteLarge)
        if activityCounter < 0 {
            activityCounter = 0
        }
        if activityCounter == 0 {
            guard let viewIndicatorBG = UIApplication.shared.keyWindow?.viewWithTag(indicatorViewTag) else {
                return
            }
            viewIndicatorBG.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}
