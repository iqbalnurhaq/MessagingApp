//
//  HomePresenterProtocol.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 10/12/23.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {
    var movies: [MovieModel] { get }
    var numRow: Int { get }
    var loadingState: Bool { get }
    var errorMessage: String { get }
    var eventHandler: ((_ event: Event) ->Void)? { get set }
    func fetchNowPlayingMovies()
}
