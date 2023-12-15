# Play Box

![](https://github.com/ncy-xing/Play-Box/blob/debb1ba165fa5c34f80a534554164a54ef646a92/playbox.png)

## Description
Play Box is a simple program which creates an animated movable box with custom colors and particle effects. It is a ![casual creator](https://escholarship.org/uc/item/4kg8g9gd) for letting users have fun playing with a digital object and generate a pleasing design which can be a background image or screensaver. 

## Quickstart
Requirements: Processing 4+
- Clone the repo
- Run PlayBox directly from Processing.

## Controls
- `Enter` or `Return`: Freeze the image to view or take a screenshot.
- `Left` and `Right` arrow keys: Change the color of the box.
- Click and drag the box to move it around the screen. 
- Drag the window to resize the view. Lines will adjust based on window size. 

## Explanation
The users are casually playnig with and creating their own view of a digital box. The box is visually reactive, changing colors, intersecting lines, and particle effects based on how the user chooses to change the box colors or move them around the screen. This gives the user a sense of interaction and interest. At the same time, the program will maintain geometric harmony (rotating the box in place, making sure the lines intersect) to make sure the view is always pleasing and satisfying. 

I designed this program initially as a perspective tool for beginner visual artists. However, as I was programming the initial elements, I found that interacting with the vanishing point and placing an interesting object there was a casual creator in itself. I then adapted the program to try to make it customizable, but still consistent and aesthetically pleasing to me. 

## Challenges 
Managing the lines and rotating box separately from each other posed some challenges, based on how Processing renders 3D elements in space. Drawing intersecting lines from the window border and having them adjust to the moving center took some thinking, involving translating point-slope form onto a relative center.

Next steps:
- More color and line width variation in the lines
- A more pronounced lighting or glow effect 
