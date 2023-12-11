//
//  MovieRepositoryProtocol.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation

protocol MovieRepositoryProtocol: AnyObject {
    func getNowPlayingMovies(result: @escaping(Result<[MovieModel], Error>) -> Void)
}


