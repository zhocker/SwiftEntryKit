//
//  EKSimpleMessage.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 6/1/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import Foundation

public struct EKSimpleMessage {
    
    /** The image view descriptor */
    public var image: EKProperty.ImageContent?
    
    /** The title label descriptor */
    public var title: EKProperty.LabelContent
    
    /** The description label descriptor */
    public var description: EKProperty.LabelContent
    
    /** The display mode of its inner properties */
    public var displayMode: EKAttributes.DisplayMode {
        didSet {
            setupDisplayMode()
        }
    }
    
    public init(image: EKProperty.ImageContent? = nil,
                title: EKProperty.LabelContent,
                description: EKProperty.LabelContent,
                displayMode: EKAttributes.DisplayMode = .inferred) {
        self.displayMode = displayMode
        self.image = image
        self.title = title
        self.description = description
        setupDisplayMode()
    }
    
    private mutating func setupDisplayMode() {
        image?.displayMode = displayMode
        title.style.displayMode = displayMode
        description.style.displayMode = displayMode
    }
}
