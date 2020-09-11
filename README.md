 <p align="center"> <img src="https://github.com/GiomarRodriguez/TechNews/blob/master/Git/Icon-1024.png" width="350"/> </p> 


# TechNews
The app with the latest technology articles published

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project will show the last articles about tecnology.
The main view display the list of articles, when tap on an article the app show the detail inside a webview.
Remove an article is so easly, just need to do a swipe on any article.
To update the list, only swip down on the main view.

The presentation's architecture is MVP (Model - View - Presenter) and a part of clean architecture around the project.
TDD (Test Driven Development) was used for the main business logic.

	
## Technologies
Project is created with:
* Xcode version: 11.7
* Swift version: 5

Third party libraries:
* [Swinject version: 2.7.0](https://github.com/Swinject/Swinject)
* [SwinjectAutoregistration version: 2.7.0](https://github.com/Swinject/SwinjectAutoregistration)
* [Quick version: 3.0.0](https://github.com/Quick/Quick)
* [Nimble version: 8.1.0](https://github.com/Quick/Nimble)
* [SnapKit version: 5.0.1](https://github.com/SnapKit/SnapKit)

	
## Setup
To run this project, install cocoapods and pods locally using terminal:

```
$ sudo gem install cocoapods
$ cd ../TeachNews
$ pod install
```
