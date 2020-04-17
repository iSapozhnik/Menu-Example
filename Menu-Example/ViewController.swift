//
//  ViewController.swift
//  Menu-Example
//
//  Created by Ivan Sapozhnik on 10.04.20.
//  Copyright © 2020 heavylightapps. All rights reserved.
//

import Cocoa
import Menu

enum Icn {
    case bing
    case duck
    case google
    case apple
    case exit

    var image: NSImage {
        switch self {
        case .bing:
            return NSImage(named: "icons8-bing-50")!
        case .duck:
            return NSImage(named: "icons8-duckduckgo-50")!
        case .google:
            return NSImage(named: "icons8-google-50")!
        case .apple:
            return NSImage(named: "icons8-apple-logo-50")!
        case .exit:
            return NSImage(named: "icons8-exit-50")!
        }
    }
}

class ViewController: NSViewController {
    private let myMenu = Menu(with: "Select a search engine:")

    @IBOutlet var showMenuButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let bing = MenuItem("Bing search", image: Icn.bing.image, action: { [weak self] in
            self?.showMenuButton.title = "Bing"
        })
        let item = MenuItem("DuckDuckGo search", image: Icn.duck.image, action: { [weak self] in
            self?.showMenuButton.title = "DuckDuckGo"
        })
        let google = MenuItem("Google search", image: Icn.google.image, action: { [weak self] in
            self?.showMenuButton.title = "Google"
        })
        let longText = MenuItem("Some very-very-very long text with no icon", action: { [weak self] in
            self?.showMenuButton.title = "Some very long text"
        })
        let emojiItem = MenuItem("Emojis are here 😎🚀", action: { [weak self] in
            self?.showMenuButton.title = "Emojis are here 😎🚀"
        })
        let exit = MenuItem("Exit", image: Icn.exit.image, action: {
            NSApplication.shared.terminate(nil)
        })
        let separator = MenuItem.separator()
        let menuItems = [
            bing,
            item,
            google,
            separator,
            longText,
            emojiItem,
            separator,
            exit
        ]

        myMenu.addItems(menuItems)
    }

    @IBAction func didClickedButton(_ sender: NSButton) {
        myMenu.show(from: sender)
    }
}
