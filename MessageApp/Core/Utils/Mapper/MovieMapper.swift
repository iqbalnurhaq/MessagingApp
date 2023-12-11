//
//  MovieMapper.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation

final class MovieMapper {
    static func mapMovieResponsesToDomains(input movieResponses: [MovieResponse]) -> [MovieModel] {
        return movieResponses.map { result in
            return MovieModel(
                adult: result.adult,
                backdrop_path: result.backdrop_path ?? "",
                genre_ids: result.genre_ids,
                id: result.id,
                original_language: result.original_language ?? "",
                original_title: result.original_title ?? "",
                overview: result.overview ?? "",
                popularity: result.popularity ?? 0,
                poster_path: result.poster_path ?? "",
                release_date: result.release_date ?? "",
                title: result.title ?? "",
                video: result.video,
                vote_average: result.vote_average ?? 0,
                vote_count: result.vote_count ?? 0
            )
        }
    }
}
