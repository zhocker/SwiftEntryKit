//
//  EKRatingMessage.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 6/1/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import Foundation

public struct EKRatingMessage {
    
    // NOTE: Intentionally a reference type
    class SelectedIndex {
        var selectedIndex: Int!
    }
    
    /** Selection */
    public typealias Selection = (Int) -> Void

    /** Initial title */
    public var initialTitle: EKProperty.LabelContent
    
    /** Initial description */
    public var initialDescription: EKProperty.LabelContent
    
    /** Rating items */
    public var ratingItems: [EKProperty.EKRatingItemContent]
    
    /** Button bar content appears after selection */
    public var buttonBarContent: EKProperty.ButtonBarContent
    
    /** The display mode of its inner properties */
    public var displayMode: EKAttributes.DisplayMode
    
    /** Selection event - Each time the user interacts a rating star */
    public var selection: Selection!

    let selectedIndexRef = SelectedIndex()
    
    /** Selected index (if there is one) */
    public var selectedIndex: Int? {
        get {
            return selectedIndexRef.selectedIndex
        }
        set {
            selectedIndexRef.selectedIndex = newValue
        }
    }
    
    /** Initializer */
    public init(initialTitle: EKProperty.LabelContent,
                initialDescription: EKProperty.LabelContent,
                ratingItems: [EKProperty.EKRatingItemContent],
                buttonBarContent: EKProperty.ButtonBarContent,
                displayMode: EKAttributes.DisplayMode = .inferred,
                selection: Selection? = nil) {
        self.displayMode = displayMode
        self.initialTitle = initialTitle
        self.initialDescription = initialDescription
        self.ratingItems = ratingItems
        self.buttonBarContent = buttonBarContent
        self.selection = selection
        setupDisplayMode()
    }
    
    private mutating func setupDisplayMode() {
        initialTitle.style.displayMode = displayMode
        initialDescription.style.displayMode = displayMode
        buttonBarContent.displayMode = displayMode
        ratingItems = ratingItems.map { item -> EKProperty.EKRatingItemContent in
            var item = item
            item.displayMode = displayMode
            return item
        }
    }
}
