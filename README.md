# UIKit Lecture # 18 - Completed app suggestion

## What we're building
![App Screenshot](screenshot.png)

## UI specifications
### Background

- Fill the entire screen
- Content mode: Aspect Fill - read more about content modes here: [https://sarunw.com/posts/how-to-resize-and-position-image-in-uiimageview-using-contentmode/](https://sarunw.com/posts/how-to-resize-and-position-image-in-uiimageview-using-contentmode/)

### Word label

Styling

- Font color: WordColor under Named Colors (#A400B5)
- Font weight: Semibold
- Font size: 50
- Alignment: Center

Constraints

- Center horizontally
- 1/4 of the screen size from the top

### Button

Styling

- Type: Filled button
- Title: Attributed
- Font: Helvetica
- Font weight: Bold
- Font size: 18
- Foreground: CreditsColor under Named Colors (#F0F2F3)

Constraints

- Center horizontally
- 2/3 of the screen size from the top

### Photo credits

Styling

- Font color: CreditsColor under Named Colors (#F0F2F3)
- Font weight: Light
- Font size: 13
- Alignment: Right
- Text: Photo by Gauravdeep Singh Bansal on Unsplash

Constraints

- 30 point right constraint to view
- 20 point bottom constraint to view


## Connecting the UI and ViewController
- Create an outlet for the `UILabel` showing the word
- Create an action for the `UIButton`


## Network request
- Create a model file
- Add url - [https://random-word-api.herokuapp.com/word?number=1&swear=1](https://random-word-api.herokuapp.com/word?number=1&swear=1)
- Add URLRequest - [https://developer.apple.com/documentation/foundation/urlrequest](https://developer.apple.com/documentation/foundation/urlrequest)
- Add URLSession - [https://developer.apple.com/documentation/foundation/urlsession](https://developer.apple.com/documentation/foundation/urlsession)
- Add JSON parsing using the `jsonObject` method - [https://developer.apple.com/documentation/foundation/jsonserialization/](https://developer.apple.com/documentation/foundation/jsonserialization/)


## Delegate
- Create a protocol for the definition of the delegate
- Add `ViewController` as the delegating class and update the `UILabel` with the result from the delegate
