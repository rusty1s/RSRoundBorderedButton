//
//  RoundBorderedButton.swift
//
//  Created by Matthias Fey on 03.02.15.
//  Copyright (c) 2015 Rusty1s. All rights reserved.
//

import UIKit

class RSRoundBorderedButton : UIButton {
    
    // MARK: Initializers
    
    init() {
        super.init(frame: CGRectZero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        setTitleColor(tintColor, forState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)
        
        layer.cornerRadius = 3.5
        layer.borderWidth = 1
        contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
        
        refreshBorderColor()
    }
    
    private func refreshBorderColor() {
        layer.borderColor = enabled ? tintColor?.CGColor : UIColor.lightGrayColor().CGColor
    }
    
    // MARK: Override
    
    override var tintColor: UIColor? {
    set(newTintColor) {
        super.tintColor = newTintColor
        setTitleColor(newTintColor, forState: .Normal)
        refreshBorderColor()
    }
    get { return super.tintColor }
    }
    
    override var enabled: Bool {
    set(newEnabled) {
        super.enabled = newEnabled
        refreshBorderColor()
    }
    get { return super.enabled }
    }
    
    override var highlighted: Bool {
    set(newHighlighted) {
        if highlighted != newHighlighted {
            super.highlighted = newHighlighted
            
            UIView.animateWithDuration(0.25) {
                self.layer.backgroundColor = self.highlighted ? self.tintColor?.CGColor : UIColor.whiteColor().CGColor
            }
            
            setNeedsDisplay()
        }
    }
    get { return super.highlighted }
    }
}
