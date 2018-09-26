# Sprint 1.1: Responder Chain (Touch and Gesture Recognizers)

In today's challenge, you'll create a simple application that allows users to add and remove new views by touch. You'll explore some gesture recognizers and practice customizing them.

Preview your project here: VIDEO URL

## Preparation

Follow these steps to create a new single-view application project in Xcode:

1. Select File > New > Project (Command-Shift-N). 
2. Select the iOS > Single View App template. Click Next.
3. Name the product, set the language to Swift, and leave the other boxes unchecked (core data, unit tests, UI tests). Click Next.
4. Navigate to a location where you want to save your new project. Click Create.

## Create a touchable view subclass

1. Add a new Swift file to your project named TouchableView.swift. Select File > New > File (Command-N). Select "Swift File", click Next, and edit the file name. Ensure that your project is checked in the Targets box and click Create.
2. Import UIKit and create a class `TouchableView` that is subclassed from UIView.

## Add gesture recognition

1. Create a new method to handle long presses: `@objc func handleLongPress(_ recognizer: UILongPressGestureRecognizer)`.
2. Create another method to handle double taps: `@objc func handleSwipe(_ recognizer: UITapGestureRecognizer)`.
3. Add a `coder`-style initializer to your class: `required init?(coder aDecoder: NSCoder)`. 
4. Add a `frame`-style initializer to your class: `override init(frame: CGRect)`. Have your initializer call the superclass's implementation with `super.init(frame: frame)` before doing your setup work.
5. In this initializer, create two gesture recognizers: a long press recognizer and a swipe recognizer. Set the target and selector for each recognizer and add them to the view. Set the swipe recognizer's direction to `.right`.

## Implement the gesture behaviors

1. The swipe recognizer removes a view. Add `self.removeFromSuperview()` to the appropriate method.
2. The long press will toggle a view between active and inactive by enabling or disabling its `isUserInteractionEnabled` property. When enabled, set the view's background color to blue. When disabled, set it to gray.
3. The long press should only activate when its state is .began.

## Add views by tapping the view controller

1. In your ViewController.swift file, add two new handler methods, `@objc func createView(_ recognizer: UITapGestureRecognizer)` and `@objc func restoreInteraction(_ recognizer: UILongPressGestureRecognizer)`.
2. Create a double-tap gesture recognizer and a long-press gesture recognizer in `viewDidLoad` that call these methods and add them to your view controller's view.
3. In the create view handler, fetch the touch point using `recognizer.location(in:)`.
4. Create a new TouchableView using `TouchableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))`. Set its background color to blue and set its center to the touchPoint.
5. Add it as a subview to the View Controller's view.
6. In the restore interaction handler, check that the recognizer state is began. If it is, iterate through the view controller's subviews and set their `isUserInteractionEnabled` states to true and their background colors to blue.

## Stretch Goals

* Instead of changing colors from blue to gray, change the view's alpha value from 1.0 to 0.5 and back.
* Remove the swipe recognizer and use touches moved to move the view with your finger.

## Compile and Test Your Work

In your completed project, you should be able to double tap in your view controller to add new views. You can disable the views with a long press and reactivate them by performing a long press on the background. Swiping an active view removes it.

Run the project and make sure everything works.
* If anything doesn't work the way the video shows, go back and debug your issues.
* As always, if you need help, follow the 20-minute rule, then ask your PM.

## References

Here are some helpful resources for your project:

* Xcode docs: `UIGestureRecognizer`, `UIView`
* [Touches, presses, and gestures](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures)
* [Using responders and the responder chain to handle events](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/using_responders_and_the_responder_chain_to_handle_events)

