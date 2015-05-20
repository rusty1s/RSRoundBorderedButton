//
//  RSRoundBorderedButton.swift
//  RSRoundBorderedButton
//
//  Created by Matthias Fey on 20.05.15.
//  Copyright (c) 2015 Matthias Fey. All rights reserved.
//

import UIKit

public class RSRoundBorderedButton : UIButton {
    
    // MARK: Initializers
    
    public convenience init() {
        self.init(frame: CGRectZero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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
    
    public override var tintColor: UIColor? {
        set(newTintColor) {
            super.tintColor = newTintColor
            setTitleColor(newTintColor, forState: .Normal)
            refreshBorderColor()
        }
        get { return super.tintColor }
    }
    
    public override var enabled: Bool {
        set(newEnabled) {
            super.enabled = newEnabled
            refreshBorderColor()
        }
        get { return super.enabled }
    }
    
    public override var highlighted: Bool {
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
