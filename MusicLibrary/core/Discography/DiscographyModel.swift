//
//  DiscographyModel.swift
//  MusicLibrary
//
//  Created by Daniel Esteban Alcantara on 30/10/26.
//


import Foundation
import UIKit
// MARK: - Song Model

struct SongModel {
    let title: String
    let duration: Int

    var formattedDuration: String {
        let minutes = duration / 60
        let seconds = duration % 60

        return String(format: "%d:%02d", minutes, seconds)
    }
}

// MARK: - Album Model

struct AlbumModel {
    let title: String
    let image: String
    let releaseYear: Int
    let songs: [SongModel]

    var sectionTitle: String {
        "\(title) - \(releaseYear)"
    }
}

// MARK: - Discography ViewModel

class DiscographyTableViewModel {

    let band: BandModel
    let albums: [AlbumModel]

    init(band: BandModel) {
        self.band = band

        switch band.name {

        case "Imagine Dragons":
            albums = [
                AlbumModel(
                    title: "Evolve",
                    image: "evolve",
                    releaseYear: 2017,
                    songs: [
                        SongModel(
                            title: "Whatever It Takes",
                            duration: 201
                        ),
                        SongModel(
                            title: "Believer",
                            duration: 204
                        ),
                        SongModel(
                            title: "Thunder",
                            duration: 187
                        )
                    ]
                ),

                AlbumModel(
                    title: "LOOM",
                    image: "loom",
                    releaseYear: 2024,
                    songs: [
                        SongModel(
                            title: "Wake Up",
                            duration: 166
                        ),
                        SongModel(
                            title: "Nice to Meet You",
                            duration: 190
                        ),
                        SongModel(
                            title: "Eyes Closed",
                            duration: 200
                        )
                    ]
                )
            ]

        case "AC/DC":
            albums = [
                AlbumModel(
                    title: "Back in Black",
                    image: "backinblack",
                    releaseYear: 1980,
                    songs: [
                        SongModel(
                            title: "Hells Bells",
                            duration: 312
                        ),
                        SongModel(
                            title: "Shoot to Thrill",
                            duration: 317
                        ),
                        SongModel(
                            title: "Back in Black",
                            duration: 255
                        )
                    ]
                ),

                AlbumModel(
                    title: "The Razors Edge",
                    image: "therazorsedge",
                    releaseYear: 1990,
                    songs: [
                        SongModel(
                            title: "Thunderstruck",
                            duration: 292
                        ),
                        SongModel(
                            title: "Fire Your Guns",
                            duration: 173
                        ),
                        SongModel(
                            title: "Moneytalks",
                            duration: 225
                        )
                    ]
                )
            ]

        case "The Chainsmokers":
            albums = [
                AlbumModel(
                    title: "Memories...Do Not Open",
                    image: "memories",
                    releaseYear: 2017,
                    songs: [
                        SongModel(
                            title: "The One",
                            duration: 177
                        ),
                        SongModel(
                            title: "Break Up Every Night",
                            duration: 207
                        ),
                        SongModel(
                            title: "Something Just Like This",
                            duration: 247
                        )
                    ]
                ),

                AlbumModel(
                    title: "Sick Boy",
                    image: "sickboy",
                    releaseYear: 2018,
                    songs: [
                        SongModel(
                            title: "This Feeling",
                            duration: 197
                        ),
                        SongModel(
                            title: "Side Effects",
                            duration: 172
                        ),
                        SongModel(
                            title: "Sick Boy",
                            duration: 193
                        )
                    ]
                )
            ]

        default:
            albums = []
        }
    }


    func getNavigationTitle() -> String {
        band.name
    }

    func getNumberOfSections() -> Int {
        albums.count
    }

    func getNumberOfRows(section: Int) -> Int {
        albums[section].songs.count
    }

    func getAlbum(section: Int) -> AlbumModel {
        albums[section]
    }

    func getSong(index: IndexPath) -> SongModel {
        albums[index.section].songs[index.row]
    }

    func getTitle(section: Int) -> String {
        albums[section].sectionTitle
    }


    func getSongDetails(
        index: IndexPath
    ) -> (
        band: BandModel,
        album: AlbumModel,
        song: SongModel
    ) {
        let album = albums[index.section]
        let song = album.songs[index.row]

        return (
            band: band,
            album: album,
            song: song
        )
    }
}

