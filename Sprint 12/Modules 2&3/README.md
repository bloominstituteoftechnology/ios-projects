# Astronomy - ObjC

## Introduction

For this project, you'll once again build Astronomy, an app for viewing photos taken by NASA's Mars rovers. You will build the app primarily in Objective-C with some Swift components. The goal of this project is to practice using Swift and Objective-C together, including using features like nullability, lightweight generics, and name customization.

This is a two-day project. The first half of the project is focused on Swift<->Objective-C interoperability, while the second half, you'll do some refactoring and add additional features.

After completing the lesson material and this project, you should be able to:

- use a bridging header to expose Objective-C to Swift
- import a Swift module header to use Swift code from Objective-C
- annotate Objective-C class interfaces for nullability
- annotate Objective-C class interfaces with lightweight generics
- call Objective-C methods from Swift
- call Swift methods from Objective-C

You are welcome and encouraged to use existing Swift solutions to this project as inspiration and help when implementing this project. However, you are asked to write all the code, including the Swift parts, from scratch.

## Instructions

You will need to create your own Xcode project and repository. Commit regularly as you complete the requirements in this project.

The instructions for this project are intentionally sparse. At this point in the course, you are familiar with most of the concepts used in building an app like this, and should be able to implement it with minimal guidance. This also means that you have the freedom to implement most parts of the app as you see fit. However, please make sure you follow the instructions that _are_ here.

### Part 1 - Swift <-> Objective-C Interoperability

For part 1 of the project, implement a client for the NASA Mars rover API. You will find API documentation here: https://api.nasa.gov/api.html#MarsPhotos . You'll need an API key, which you can get by signing up here: https://api.nasa.gov/index.html#apply-for-an-api-key

#### Guidelines and Requirements

1. Implement the app in Objective-C with the exception of the main collection view controller, the detail view controller, and one model type of your choice. The rest of the model, networking, and view components must be written in Objective-C.
2. Your Objective-C code must be thoroughly annotated for nullability and generics.
3. You must cache images using a custom cache class written in Objective-C. It should be a generic type so it can be used with any type.

### Part 2 - Additional Enhancements

For part 2 of the project, you'll add additional features to continue your practice of Objective-C.

#### Guidelines and Requirements

1. If you haven't already done so, use the `NSOperation`-based image loading system coverred in the Concurrency modules. If you do this, you must write the code in Objective-C. Note that the `ConcurrentOperation` subclass is not required. Your Objective-C `NSOperation` subclass should override `isAsynchronous` to return `YES`, then directly set the `ready`, `executing` and `finished` properties as appropriate during its execution. These properties are observed by the `NSOperationQueue` machinery using KVO, and therefore your use of them must be KVO-compliant.
2. Your app should allow the user to move between sols.

## Go Further

If you finish early or want to push yourself, here are a few additional features you can implement:

- Create a framework for the model and networking code, which is platform-independent (ie. should work fine on macOS and tvOS)
- Implement UI to allow the user to see all available rovers and select them
- Modify your `Cache` class so that it can be configured to evict old entries if its size gets too big. This prevents the app from using too much memory due to a lot of cached data.
- Investigate and implement the use of the system-provided `URLCache` API for caching instead of your own cache class. What benefit does this provide? Downsides?
- Support pinch-to-zoom on the detail view controller.