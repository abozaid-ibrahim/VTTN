# Voice to text Notes


[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">VTTN</h3>

  <p align="center">
 MVP to use voice notes, mainly triggered by siri, and sound commands, 
 the goal of it is to create a clipboard to your mind, for people are busy and gets random ideas, task want to write it down quickly while they are shoping, driving, ...
  
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#architecture">Architecture</a></li>
    <li><a href="#folders-structure">Folders Structure</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

  Demo app shows list of photos and thier details


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

at the current state you have to install the pre requisites manually at more advanced state can setup the 
* Swiftlint
  ```sh
  brew install swiftlint
  ```

### Installation
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app



<!-- Architecture -->
## Architecture

Using a modular architecture where you have couple of modules contains the functionality could be used later on by SPM or on other choice according to the business logic and tech team needs. 

Used basic MVVVM architecture to apply the use case needs, for more advanced usage could be there better alternative like RIBs, Viper, Clean Architecture, ...etc

Used both [SwiftLint](https://github.com/realm/SwiftLint), [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) by Homebrew. 



## Folders Structure
* Modules: Include separate modules, components, extensions, ...etc.
* Scenes: Group of app UI screens.


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact

Abozaid Ibrahim - [@https://linkedin.com/in/abozaid-ibrahim](https://linkedin.com/in/abozaid-ibrahim) - abozaid.ibrahim11@gmail.com



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-url]: https://github.com/abozaid-ibrahim/MoviesApplication/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/abozaid-ibrahim
