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
        DispatchQueue.main.async {
            self.activityIndicator.activityIndicatorViewStyle = indicatorStyle
            if indicatorStyle == .white || indicatorStyle == .gray {
                self.viewIndicatorBG.frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
            } else {
                self.viewIndicatorBG.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
            }
            self.setContentInCenter()
        }
    }
    
    func setContentInCenter() {
        DispatchQueue.main.async {
            self.viewIndicatorBG.center = (UIApplication.shared.keyWindow?.center)!
            self.activityIndicator.center = CGPoint(x: self.viewIndicatorBG.frame.size.width / 2,
                                                    y: self.viewIndicatorBG.frame.size.height / 2)
            
            UIApplication.shared.keyWindow?.bringSubview(toFront: self.viewIndicatorBG)
        }
    }
    
    open func showHUD() {
        if activityCounter == 0 {
            DispatchQueue.main.async {
                self.viewIndicatorBG.backgroundColor = .black
                self.viewIndicatorBG.alpha = 0.7
                self.viewIndicatorBG.tag = self.indicatorViewTag
                self.viewIndicatorBG.layer.cornerRadius = self.viewIndicatorBG.frame.size.width / 8
                self.viewIndicatorBG.layer.masksToBounds = true
                self.setIndicatorStyle(indicatorStyle: self.indicatorStyle)
                self.activityIndicator.startAnimating()
                self.viewIndicatorBG.addSubview(self.activityIndicator)
                UIApplication.shared.keyWindow?.addSubview(self.viewIndicatorBG)
                self.setContentInCenter()
                
                UIApplication.shared.beginIgnoringInteractionEvents()
            }
        }
        if activityCounter < 0 {
            activityCounter = 0
        }
        activityCounter += 1
    }
    
    open func hideHUD() {
        activityCounter -= 1
        if activityCounter < 0 {
            activityCounter = 0
        }
        if activityCounter == 0 {
            guard let viewIndicatorBG = UIApplication.shared.keyWindow?.viewWithTag(indicatorViewTag) else {
                return
            }
            DispatchQueue.main.async {
                viewIndicatorBG.removeFromSuperview()
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
}
