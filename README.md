# ImageSlideshowSaver

ImageSlideshowSaver is a macOS screen saver built using Apple's `ScreenSaver` framework. It elegantly displays a slideshow of your favorite images transitioning with a smooth cross-fade animation effect.

## Features

- Simple and lightweight.
- Displays images from a specified folder.
- Utilizes cross-fade animations between images.
- Highly customizable timer settings.

## Installation

1. **Clone the Repository**

    ```bash
    git clone https://github.com/YOUR_USERNAME/ImageSlideshowSaver.git
    cd ImageSlideshowSaver
    ```

2. **Build using Xcode**

    Open the `.xcodeproj` or `.xcworkspace` file in Xcode, then build and run the application.

3. **Setting up the Screensaver**

    - After building the project, locate the `.saver` file.
    - Double-click on the `.saver` file to install the screensaver.

## Configuration

- By default, the slideshow fetches images from the `images` directory located in the project's resources. Replace the contents of this folder with your desired images, or update the `folderName` variable in the code to point to a different directory.

- Adjust the `timeInterval` in the `setupTimer()` function if you want to change the duration each image is displayed.
