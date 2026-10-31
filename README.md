# Music Library Explorer
 
**iOS Development Assignment | Swift + UIKit**
 
---
 
## User Story
 
As a music fan, I want to browse bands, explore their albums and songs, and view song details so that I can explore a music library organized by artist and album.
 
## Objective
 
Build an iOS application with three connected screens: **Bands**, **Discography**, and **Song Details**. Use local data and images; no internet connection or external API is required.
 
### 1. Bands Screen
 
- Display at least three bands in a `UITableView`. Each custom cell must show the band's name and image.
- Use **Bands** as the navigation title.
- Selecting a band must push its Discography screen and pass the selected band's information.
### 2. Discography Screen
 
- Use the selected band's name as the navigation title and display only its albums and songs.
- Include at least two albums per band and three songs per album.
- Each table section represents one album. Its header must show the album title and release year.
- Each row represents a song and must show its title and duration in `m:ss` format.
- Selecting any song must push its Song Details screen with the correct song, album, and band information.
> **Example:** A section titled **From Zero (Deluxe Edition) - 2025** contains the songs:
>
> | Song | Duration |
> |------|----------|
> | The Emptiness Machine | 3:09 |
> | Heavy Is the Crown | 2:46 |
> | Two Faced | 3:03 |
>
> The next album appears as another section with its own songs.
 
### 3. Song Details Screen
 
- Show the selected song's title, duration, band name, album title, release year, and album cover.
- Use the song title as the navigation title.
- Build the content with an image view and labels. Use Auto Layout and allow vertical scrolling whenever the content does not fit on the screen.
- Provide standard Back navigation to Discography and then Bands. Audio playback is not required.
---
 
## Requirements & Evaluation
 
### Technical Requirements
 
- **Use MVC (Model-View-Controller):** models represent and manage data, views handle presentation, and view controllers coordinate user actions and screen updates. Organize the code by these responsibilities.
- **Configure the initial screen explicitly in `SceneDelegate`** using `scene(_:willConnectTo:options:)`. Set up the window and its root view controller there, including a navigation controller where needed. Use a different initial storyboard, a XIB, or a programmatic screen instead of `Main.storyboard`; remove any automatic Main storyboard startup configuration.
- **Xcode is mandatory.** Create, build, and run the application as an iOS project in Xcode. A submission created exclusively with another editor or development environment does not meet this requirement.
- Use **Swift and UIKit**, `UITableView` for both lists, and `UINavigationController` for push and Back navigation.
- Create custom cells using `UITableViewCell` subclasses and models using Swift structures or classes for **bands, albums, and songs**. Represent the relationships between these models.
- Include all sample data and images in the project. Real or fictional music data is acceptable.
- You may use Storyboards, XIB files, programmatic UIKit, or a combination of these approaches.
 
