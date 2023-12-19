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
}
