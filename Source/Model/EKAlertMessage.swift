//
//  EKAlertMessage.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 6/1/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

public struct EKAlertMessage {
    
    public enum ImagePosition {
        case top
        case left
    }
    
    /** The position of the image inside the alert */
    public let imagePosition: ImagePosition
    
    /** Image, Title, Description */
    public var simpleMessage: EKSimpleMessage
    
    /** Contents of button bar */
    public var buttonBarContent: EKProperty.ButtonBarContent
    
    public init(simpleMessage: EKSimpleMessage,
                imagePosition: ImagePosition = .top,
                buttonBarContent: EKProperty.ButtonBarContent,
                displayMode: EKAttributes.DisplayMode = .inferred) {
        self.simpleMessage = simpleMessage
        self.simpleMessage.displayMode = displayMode
        
        self.buttonBarContent = buttonBarContent
        self.buttonBarContent.displayMode = displayMode
        
        self.imagePosition = imagePosition
    }
}
