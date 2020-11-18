# FallingWords - iOS App #
![app-preview](https://user-images.githubusercontent.com/27929436/90338175-f2131e00-dfe7-11ea-84dd-03bcd820c4d9.png)

    A simple game that tries to focus on Game Engine and great view Animations.
    
# Swifty Protocol-Oriented with Dependency Injection #

    - You have to find out if the word on top has the correct answer in the falling view labe.
    - You have 3 lives, every time you don't answer correctly you lose one life.
    - Every correct answer will give you one point.
    - When word falls at finish and you don't give an answer, you will lose one life.
    - When you spent all the lifes, game will over and you can restart if you want.

## Repository ##

    * [Bitbucket repository](https://bitbucket.org/)

## Developers ##

    * Egzon Pllana - 16/08/2020
    
## Features ##

    - Protocol & Object Oriented programming
    - Dependency Injection
    - MVVM Pattern
    - SegueHandler
    - Codable
    - Completion with  Result type
    - Storyboard based
    
## Cocoapods ##

    * No pods used.

### Pods documentation ###

    * No pods used.

## Application GUI ##

    Application UI inspired from random designed views on
    Dribbble (https://dribbble.com).

## Design Pattern: MVVM ##
    How Does the Model-View-ViewModel Pattern Work
    
#### Rule #1 #### 
    First, the view or window doesn't know about the controller it is owned by.
    Remember that views and windows are supposed to be dumb objects. They only know
    how to present data to the user. This is a rule you should never break. Ever. 
    The view doesn't know about the view controller it's owned by.
    
#### Rule #2 #### 
    Second, the view or window controller doesn't know about the model. 
    This is something that separates MVC from MVVM. The view controller doesn't 
    know about the model.
#### Rule #3 #### 
    The model doesn't know about the view model it is owned by. This is another 
    rule that should never be broken. The model should have no clue who it is 
    owned by. The model doesn't know about the view model it's owned by.
#### Rule #4 #### 
    The view model owns the model. In a Model-View-Controller application, 
    the model is usually owned by the view or window controller. The view model 
    owns the model.
#### Rule #5 #### 
    The view or window controller owns the view or window. This relationship 
    remains unchanged. The view controller owns the view.
#### Rule #6 #### 
    And finally, the controller owns the view model. It interacts with the model 
    layer through one or more view models.

## App Structure ##

### Swifty Protocol-Oriented Dependency Injection ###

    - The key to dependency injection is protocols – from there sprouts many variations,
    flavours, and techniques.
    - Battle-tested DI implementation with no outside dependencies or magic. 
    - It combines protocol extension and type erasure to give you a solid, flexible dependency
    injection that works great with unit test and even frameworks.
        
## Application Coding Pattern ##

    Inpired by the way of coding by Olivier Voyer and Basem Emara.
    Olivier Voyer: https://linkedin.com/in/oliviervoyer
    Basem Emara: https://linkedin.com/in/basememara
        
## Challenge ##

### Time invested in this challenge ###
    Planing the UI: 30min
    Planing the App Architecture: 20min
    Planing App Game Engine: 45 min
    Implementing UI: 60min
    Implementing Models and ViewModels: 25min
    Implementing GameEngine and WordsBank services: 120min
    Implemeting usage of GameEngine and WordsBank services: 60min
    Testing the app during development time: 15min
    
    Total invested time: 6h and 25min.

### Decisions made because of restricted time ###
    Not much time to make more ui animations and to make the app more friendly.
    Not much time to make the game more challengable with more game modes.
    No time to build unit tests.
    
### First thing to improve or add if there had been more time ###

    Implement game levels, Realm Storage Service to save user scoreboard and
    high score to make the game more attractive and challengable. 
    Implement some basic Unit Test.
