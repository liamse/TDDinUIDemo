# Snapshot Testing in iOS – Demo Project

This repository contains the demo project for my article:  
[Snapshot Testing in iOS: How to TDD Your UI and Avoid Visual Bugs](https://esmuil.medium.com/snapshot-testing-in-ios-how-to-tdd-your-ui-and-avoid-visual-bugs-520dddb60879) on Medium.

The article explains how snapshot testing helps you catch visual regressions automatically and keep your UI consistent across devices, themes, and orientations. Instead of manually checking your views in the simulator, you write tests that compare your UI against baseline images. This way, design changes are intentional, and bugs are spotted immediately.

## Features
- Setup of [pointfreeco/swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing)
- Examples for iPhone and iPad
- Support for light & dark mode
- Portrait and landscape orientation snapshots
- SwiftUI demo views with tests

## Requirements
- iOS 17+
- Xcode 15+
- Swift 5.9+

## Getting Started
1. Clone this repository:
   ```bash
   git clone https://github.com/liamse/TDDinUIDemo.git
   ```
