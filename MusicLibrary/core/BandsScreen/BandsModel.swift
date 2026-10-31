//
//  BandsModel.swift
//  MusicLibrary
//
//  Created by Daniel Esteban Alcantara on 30/10/26.
//

import Foundation
import UIKit

struct BandSection {
    let title: String
    let bands: [BandModel]
}

struct BandModel {
    let image: String
    let name: String
    let country: String
    let formationYear: Int
    let genre: String
    let members: [String]
    let description: String

    var membersText: String {
        members.joined(separator: ", ")
    }
}


class BandTableViewModel {

    let bands: [BandModel]

    private(set) var filterBands: [BandModel] = []
    private(set) var sections: [BandSection] = []


    init() {
        bands = [
            BandModel(
                image: "imaginedragons",
                name: "Imagine Dragons",
                country: "Estados Unidos",
                formationYear: 2008,
                genre: "Rock alternativo",
                members: [
                    "Dan Reynolds",
                    "Wayne Sermon",
                    "Ben McKee"
                ],
                description: """
                Imagine Dragons es una banda estadounidense de rock alternativo formada en Las Vegas, Nevada, en 2008. Se caracteriza por combinar elementos del rock, pop y música electrónica, creando canciones con melodías enérgicas y letras emotivas.

                Alcanzó reconocimiento internacional con su álbum debut Night Visions, lanzado en 2012, que incluye canciones como Radioactive, Demons e It's Time. Posteriormente consolidó su popularidad con éxitos como Believer, Thunder y Whatever It Takes.

                Sus canciones suelen abordar temas relacionados con la superación personal, los conflictos emocionales y la búsqueda de identidad. Gracias a su estilo musical, Imagine Dragons se ha convertido en una de las bandas más reconocidas de su generación.
                """
            ),

            BandModel(
                image: "acdc",
                name: "AC/DC",
                country: "Australia",
                formationYear: 1973,
                genre: "Hard rock",
                members: [
                    "Angus Young",
                    "Brian Johnson",
                    "Stevie Young"
                ],
                description: """
                AC/DC es una banda australiana de hard rock formada en Sídney en 1973 por los hermanos Malcolm y Angus Young. Es reconocida por sus potentes riffs de guitarra, su energía sobre el escenario y su estilo musical característico.

                Durante sus primeros años alcanzó gran popularidad con el vocalista Bon Scott y canciones como Highway to Hell. Después de su fallecimiento en 1980, Brian Johnson se incorporó como cantante y la banda lanzó Back in Black, uno de los álbumes más exitosos de la historia del rock.

                Entre sus canciones más reconocidas se encuentran Thunderstruck, Highway to Hell, Back in Black y You Shook Me All Night Long. AC/DC es considerada una de las agrupaciones más influyentes del hard rock.
                """
            ),

            BandModel(
                image: "chainsmokers",
                name: "The Chainsmokers",
                country: "Estados Unidos",
                formationYear: 2012,
                genre: "Música electrónica",
                members: [
                    "Alex Pall",
                    "Drew Taggart"
                ],
                description: """
                The Chainsmokers es un dúo estadounidense de música electrónica formado en Nueva York en 2012 por Alex Pall y Drew Taggart. Su estilo combina música electrónica, pop y elementos del indie, destacando por sus melodías pegadizas y colaboraciones con diferentes artistas.

                Comenzaron a ganar popularidad con el sencillo #Selfie en 2014. Posteriormente alcanzaron reconocimiento internacional con canciones como Roses, Don't Let Me Down y Closer, esta última en colaboración con Halsey.

                También son conocidos por canciones como Paris y Something Just Like This, realizada junto a Coldplay. Su propuesta musical mezcla sonidos electrónicos con letras que hablan de relaciones personales, recuerdos y experiencias juveniles.
                """
            )
        ]

        filterBands = bands
        updateSections()
    }

    // MARK: - Sections

    private func updateSections() {
        let grouped = Dictionary(
            grouping: filterBands,
            by: \.genre
        )

        sections = grouped.keys.sorted().map { title in
            BandSection(
                title: title,
                bands: grouped[title] ?? []
            )
        }
    }

    // MARK: - TableView Data

    func getNumberOfSections() -> Int {
        sections.count
    }

    func getNumberOfRows(section: Int) -> Int {
        sections[section].bands.count
    }

    func getBand(index: IndexPath) -> BandModel {
        sections[index.section].bands[index.row]
    }

    func getTitle(section: Int) -> String {
        sections[section].title
    }

    // MARK: - Search

    func filterBands(with text: String) {
        let query = text.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        if query.isEmpty {
            filterBands = bands
        } else {
            filterBands = bands.filter {
                $0.name.localizedStandardContains(query) ||
                $0.country.localizedStandardContains(query) ||
                $0.genre.localizedStandardContains(query) ||
                $0.membersText.localizedStandardContains(query) ||
                String($0.formationYear).contains(query)
            }
        }

        updateSections()
    }
}
