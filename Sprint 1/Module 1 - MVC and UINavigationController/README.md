# Collection

For this project, you'll build an app that helps manage a collection of items. They could be stamps, records, action figures, or anything else you collect.

This project will help you practice the concepts learned in the first lesson of Sprint 1 in Lambda's full time iOS course. After completing the lesson material and this project, you should be able to:

- implement a segue between a table view cell and a detail view controller
- use UINavigationController to display data hierarchically 
- use the UINavigationItem API to customize navigation bar
- missing value
- understand and explain the purpose of the MVC design pattern
- understand and explain the purpose of the model layer in MVC
- understand and explain the purpose of the controller layer in MVC
- understand and explain the purpose of the view layer in MVC
- implement a model controller

## Part One - Model Types and Model Controller

#### Model Type:

You will need just one model type in this project. Your model objects will represent items in a hobby collection.

1. Create a Swift file using Xcode's File->New File menu option. Name the file "Item.swift".
2. In the newly created file, define an `Item` struct with properties for `name`, `value`, and `location`. Use appropriate types for each of these properties.
3. Make the `Item` struct `Equatable` so it can be compared.

#### Model Controller:

The model controller is a controller object that is specifically responsible for manipulating model objects. It should have methods to create, read, modify, and delete collection items.

1. Create a Swift file using Xcode's File->New File menu option. Name the file "ItemController.swift".
2. In the newly created file, define a class called `ItemController`.
3. Add a property called `items` whose type is an array of `Item`s. The property should be marked with `private(set)` to prevent outside code from modifying it directly.
4. Add a method called `createNewItem()`. It should take arguments for each of the properties on `Item`.
5. Implement `createNewItem()` so that it creates a new `Item` instance using in the passed in property values, appends it to the controller's `items` array property, then returns the newly created item.
6. Add another method called `update(item:,...)`. It should take an `Item`, and new values for each of the properties on `Item`.
7. Implement `update(item:...)` so that it first finds the index of the passed in item in `items`, changes its properties, removes the original item, then re-inserts the changed item at the same index in `items`.

## Part Two - Storyboards

Set up Main.storyboard so it contains scenes for the view controllers in the app.

#### Table View Controller

1. Open Main.storyboard. Delete the existing, default view controller. You should also delete the corresponding ViewController.swift file in the project.
2. Drag out a `UITableViewController`.
3. Embed the table view controller in a navigation controller.
4. Set the navigation controller as the initial view controller for the storyboard.
5. Create a subclass of `UITableViewController` called `CollectionTableViewController`. In the storyboard, change the table view controller's class to `CollectionTableViewController`.
6. Set the style for the table view's cell prototype to "Basic" and set an well-named reuse identifier for it.
7. Add a bar button item to the table view controller's navigation bar.
8. Set the bar button item's "System Item" attribute to "Add" in the attributes inspector. It should look like a "+" sign after you've done this.

#### Detail View Controller

1. Drag out another view controller. This will be the detail view controller.
2. Create a subclass of `UIViewController` called `ItemDetailViewController`. In the storyboard, change the detail view controller's class to `ItemDetailViewController `.
3. Create a Show segue from the table view cell in the table view controller to the detail view controller.
4. Create another Show segue from the Add button in the table view's navigation bar to the detail view controller.
4. Give both segues separate, well-named identifiers.
5. Add a navigation item to the detail view controller by dragging one onto it from the Library pane.
6. Add a bar button item to the navigation bar. Make its title "Save".
7. Add three text fields with labels to the view controller. They should be labled: "Item:", "Value:", and "Location:".

#### Outlets and Actions

1. Create IBOutlets for each of the text fields on the detail view controller.
2. Create an IBAction called `save(_:)` for the save button on the detail view controller.

## Part Three - Implement View Controller Code

Now you're ready to implement the code that makes the application actually do what it's meant to do.

#### Detail View Controller

1. Open `ItemDetailViewController.swift`.
2. Create a property called `item`. It should be of type `Item?`.
3. Create a private function called `updateViews()`. It should update the text fields with values from the `item` property. Use one or more guard statements to unwrap `item`, and to ensure that the view is loaded.
4. Call `updateViews()` from `viewDidLoad()`.
5. Add a didSet property observer to the `item` property. Use it to call `updateViews()` when the value of `item` changes.
6. Implement the `save(_:)` IBAction. 
	- If the `item` property is **not nil**, use the model controller's `update()` method to update the existing item with new values.
	- If the `item` property is **nil**, use the model controller's `create()` method to create a new item with values taken from the text fields.
	- At the end of the `save(_:)` method, pop back to the table view controller.

#### Table View Data Controller

1. Open `CollectionTableViewController.swift`. Delete any commented-out code that you won't need.
2. Add a property called `itemController` and initialize it with an instance of the `ItemController` model controller class.
3. Implement the `tableView(_:, numberOfRowsInSection:)` and `tableView(_:, cellForRowAt:)` methods.
4. In `tableView(_:, cellForRowAt:)` configure the cell so that its `textLabel` displays the item's `name`.
5. Implement `prepare(for segue:, sender:)`.
	- If the triggered segue is for showing the detail for an existing item, it should configure the detail view controller with the selected item along with passing the `itemController` to it.
	- If the trigger segue is for adding a new item, it should configure the detail view controller with the `itemController` only.

## Part Four - Testing

1. Run the project and make sure everything works.
2. If anything doesn't work the way the video shows, spend time debugging it and fixing the problem.
3. As always, if you need help, follow the 20-minute rule, then ask your PM.

## Go Farther

If you finish early or want to push yourself, here are a few additional features you can implement:

- Add a favorite button to the detail view controller. When the button is tapped, it should toggle a `isFavorite` property on the item.
- Make it so that favorite items appear at the top of the items table.
- Implement support for deleting items.