## Respond to touches.

Follow these steps to finish up your control and add user feedback.

1. In `updateValue`, you handle touches by checking to see whether they intersect with any of your stored label subviews. Implement a loop that iterates through your component labels and detect whether each touch's location (`touch.location(in: self)`) is contained in each label's frame.
2. When a touch overlaps a label, set the control's value to that tag, update the label colors to reflect the current touch, and send an action for `valueChanged`.
3. **Stretch** It's better to store the old value before changing it and only send an update when the value has changed.
4. **Stretch** Add the following `UIView` animation to flare the view a little when selected.

```
extension UIView {
// "Flare view" animation sequence
func performFlare() {
func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
func unflare() { transform = .identity }

UIView.animate(withDuration: 0.3,
animations: { flare() },
completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
}
}
```

This method adjusts your view's `transform`, telling it to inflate to 60% larger than its normal size and then shrink back down to its default size (using the "no change" `identity` transform).

## Test
1. Run the project and make sure everything works.
2. If anything doesn't work the way the video shows (outside of the two stretch goals), go back and debug your issues.
3. As always, if you need help, follow the 20-minute rule, then ask your PM.

## Go Farther
Time allowing, here are some things you can try.

1. Change the number of buttons to allow 4 or 6 star rating controls. Does everything work right with your change being in a single line of code?
2. Flip the control for use in right-to-left language countries, where you slide from right to left.
3. Create different flare animations. Things you can animate include background color, translucency (the view's `alpha` property), and rotation. You'll be able to find examples of these with simple web searches.

## References

Here are some helpful resources for your project:

* `UIControl` documentation (Xcode)
* `UIControlEvents` documentation (Xcode): a list of all available control events, including the "value changed" event used in this challenge.
* How to build selectors by hand (apologies for the URL): http://fuckingselectorsyntax.com
* Examples of custom controls: Search the web for `uicontrol site:github.com`
* Custom Cocoa Control repository: https://www.cocoacontrols.com
