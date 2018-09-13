# Module 1.1: Intro to Lambda / Intro to iOS Development Challenge

This challenge walks you through the process of creating a touch-based view application that will help you better understand and explain the core iOS view model.

This project helps you practice the concepts learned in Lambda's iOS module 1.1. Because this is the first project, these instructions are a lot more explicit than they'll be as you move through this course.

## Challenge Preview

Here's a video that demonstrates the app you'll be writing today: https://youtu.be/kAi8p41i1p4

## Set up the Project

Follow these steps to create a new single-view application project in Xcode:

1. Select File > New > Project (Command-Shift-N). 
2. Select the iOS > Single View App template. Click Next.
3. Name the product, set the language to Swift, and leave the other boxes unchecked (core data, unit tests, UI tests). Click Next.
4. Navigate to a location where you want to save your new project. Click Create.

## Directions: Creating Views

These steps walk you through creating the challenge. You'll be doing all your work today in the ViewController.swift file.

Your first challenge is to create a new view as a user drags their finger across the screen. To do this you have to add `touchesBegan` and `touchesContinued` handlers to your view controller class. Use Xcode's auto completion to do this and erase the `code` placeholder from each method.

**Create an origin property**. Add an origin property to your class and set it to zero:

```
var origin = CGPoint.zero
```

**Calculate the touch location**. In each method you'll need to fetch the location of a touch in your view. To do this takes two steps. Use this boilerplate for both methods:

```
guard let touch = touches.first else { return }
let touchPoint = touch.location(in: self.view)
```

This code grabs a touch and, as it is an optional value, it unwraps it. It then calculates its location.

**Create a new view**. You create a new view in touches-began and add it to your view hierarchy. Create a new view using `UIView()`, and set its `isUserInteractionEnabled` property to false. This step ensures that this view won't directly grab your touches and try to interpret them. Add the new view to your view controller's view (`self.view`) using `addSubview`.

You need to set the new view's location (the point where you touched down) and size (zero) by setting its frame:

```
newView.frame = CGRect(origin: touchPoint, size: .zero)
```

Set the `origin` property to the `touchPoint`:

```
origin = touchPoint
```

Set the view's background color to `UIColor.gray.withAlphaComponent(0.3)`. You can play around with this color and translucency level after you get the main program working.

**Grow the view**. You expand the view as the user moves their finger, so you must use that second point and calculate the width and height that's changed. Since you're working in a new method (the touches moved one), you have to retrieve the view. You will use the origin you stored in the touches began method:

```
guard let newView = view.subviews.last
  else { return }
```

**Challenge**: Here's where you're going to have to put on your thinking hat. You need to update the `newView`'s frame. You know its origin but you don't know how wide or high to set it. Calculate this from the new `touchPoint` and the `origin`. Once you figure it out, update the `newView`'s frame:

```
newView.frame = CGRect(
  x: origin.x,
  y: origin.y,
  width: ???,
  height: ???
).standardized
```

Don't forget to include the `standardized` call at the end of setting this frame. This call makes sure that any non-standard rectangles (for example if you drag up and to the left, so the height or width are negative extents) are properly standardized before they are applied to the view frame.

**Challenge**: Explain in comments why you needed to store the origin instead of just retrieving it from the `newView`'s frame.

**Run it.** Compile and test your application. Make sure to pause your application while running and look at the view hierarchy. (Don't forget to use `continue` to resume the application.)

## Directions: Clearing Views

Once your application is running properly, you'll want to add a long-press gesture recognizer to your main view to clean up all the subviews. Follow these steps to build this functionality.

1. Create an instance of `UILongPressGestureRecognizer` in your `viewDidLoad` method. Set its target to `self` and its action to `#selector(cleanView_:)`.
1. Set the recognizer's minimum press duration to one second.
1. Add the recognizer to your view controller's view (`self.view`).
1. Create a `cleanView(_ sender: Any)` method. Make sure to mark it with `@objc` because otherwise you cannot use it with the selector.
1. Implement `cleanView` by adding a loop that iterates through each subview in `self.view.subviews`. Call `removeFromSuperview()` on each subview.

## Test
1. Run the project and make sure everything works.
2. If anything doesn't work the way the video shows, go back and debug your issues.
3. As always, if you need help, follow the 20-minute rule, then ask your PM.

## Stretch goals

Time allowing, here are some things you can try.

* Try using a different gesture recognizer. (There's a list in the `UIGestureRecognizer` documentation.) Why wouldn't you want to use "swipe" for this application?
* Try adding random translucent colors instead of just gray.

## References

* Xcode documentation for `UIView`, `UIGestureRecognizer`, `UILongPressGestureRecognizer` classes
* Handling touches in your views: https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_touches_in_your_view
* Using responders and the responder chain: https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/using_responders_and_the_responder_chain_to_handle_events
