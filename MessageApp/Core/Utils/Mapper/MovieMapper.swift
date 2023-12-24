//
//  MovieMapper.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation
import CoreData

final class MovieMapper {
    static func mapMovieResponsesToDomains(input movieResponses: [MovieResponse]) -> [MovieModel] {
        return movieResponses.map { result in
            return MovieModel(
                adult: result.adult,
                backdrop_path: result.backdropPath ?? "",
                genre_ids: result.genreIds,
                id: result.id,
                original_language: result.originalLanguage ?? "",
                original_title: result.originalTitle ?? "",
                overview: result.overview ?? "",
                popularity: result.popularity ?? 0,
                poster_path: result.posterPath ?? "",
                release_date: result.releaseDate ?? "",
                title: result.title ?? "",
                video: result.video,
                vote_average: result.voteAverage ?? 0,
                vote_count: result.voteCount ?? 0
            )
        }
    }
    
    static func mapMovieResponsesToEntities(input movieResponses: [MovieResponse], context: NSManagedObjectContext) -> [MovieEntity] {
        
        return movieResponses.map { result in
            
//            let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: context)
//            let newMovie = NSManagedObject(entity: entity!, insertInto: context)
            
            let newEntity = NSEntityDescription.insertNewObject(forEntityName: "MovieEntity", into: context) as! MovieEntity
            
            newEntity.adult = result.adult
            newEntity.backdropPath = result.backdropPath
            newEntity.genreIds = result.genreIds as NSObject
            newEntity.id = Int64(result.id)
            newEntity.originalTitle = result.originalTitle
            newEntity.originalLanguage = result.originalLanguage
            newEntity.overview = result.overview
            newEntity.popularity = result.popularity ?? 0
            newEntity.posterPath = result.posterPath
            newEntity.releaseDate = result.releaseDate
            newEntity.title = result.title
            newEntity.video = result.video
            newEntity.voteAverage = result.voteAverage ?? 0
            newEntity.voteCount = Int64(result.voteCount ?? 0)
            
            return newEntity
        }
    }
}
