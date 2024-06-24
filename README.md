# IOS_Arkit_doushouqi

*Chloé Mourgand, Lucie BEDOURERT and Thomas CHAZOT*

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-000000?style=for-the-badge&logo=swift&logoColor=white)
![SpriteKit](https://img.shields.io/badge/SpriteKit-ff2dac?style=for-the-badge&logo=swift&logoColor=white)
![ARKit](https://img.shields.io/badge/ARKit-green?style=for-the-badge&logo=swift&logoColor=white)

Our app is a Dou Shou Qi game developed for iOS devices. We developed this app in a study context.

It allows you to play games against a friend or an AI (which plays random moves) on the same device.

You can play both in 2D and AR; you just have to choose when you create a game.

You will be able to switch between light and dark mode in-app (system mode by default), and our app is available in the following languages (based on your device's language):

![English](https://img.shields.io/badge/Language-English-blue?style=for-the-badge)
![Français](https://img.shields.io/badge/Language-Français-blue?style=for-the-badge)

Note that the model and logic of the app was given by our teacher, a correction of what we previously worked on.

## Install the project

To be able to launch our app, clone the repository on a macOS device:

```shell
git clone https://codefirst.iut.uca.fr/git/chthlu/IOS_Arkit_doushouqi.git
```

- Open **Xcode** and open the workspace file named `DouShouQi.xcworkspace`
- Edit your signing and scheme
- Make sure the launched app is named `DouShouQi` in the scheme

:tada: You are now ready to play :tada:

### Features and screens

*Insert video here*

The following text is an explanation of the video:

* **Home page:** This page contains all the games that were started and then saved in the stub (there are no API calls in our app). You can continue a game from here. Click on the play button to create a new game.
* **Create a new game:** Configure a new game on this page. You can choose to play against the BOT or against a friend. Choose the names of the players and take photos of the players. You can choose to play a 2D game or an AR game with the toggle.

> If a face is detected in the photo you have taken, note that the photo will be cropped around the face. To implement that, we used Vision, which is an Apple framework created to perform computer vision tasks. Find its documentation here: [Vision](https://developer.apple.com/documentation/vision)

* **2D and AR game:** To implement the 2D game, we used [Sprite Kit](https://developer.apple.com/spritekit/), which is a framework made to easily create 2D games for SwiftUI apps. For the AR game, we used [AR Kit](https://developer.apple.com/augmented-reality/arkit/), designed to create AR apps. The assets we used for the AR part were given by our teacher. When a game is over, it displays a screen indicating who won.
* **History page:** It saves here all the results of the games you played (victory or defeat).
* **Ranking page:** Find the ranking of the players here, based on their number of victories, defeats, and the number of games played.
* **Menu page:** A menu composed of 2 entries to access your profile and the settings page.
* **Profile page:** A page where all your information is stored (you are "PifouDAmour").
* **Settings page:** A page where you can change the theme of the app (light or dark) and enable/disable background music and sound effects.

## Known bugs

There are a few bugs we are aware of in the app, here they are:
* When you want to continue a game (from the home page), the pieces of the player who played last are buggy (you can move them as you want, without them being replaced correctly on the board).
* The button "Pursue the game later" when you want to go back from a game does nothing on click. We haven't implemented the logic to save a game in the stub.

## What is this?

:egg: We made you a little easter egg! Here are your clues: :egg:
* Keep the volume up :loud_sound: !!
* How many / 7?

