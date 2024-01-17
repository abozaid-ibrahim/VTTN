//
//  AsyncImageURL.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation
protocol AsyncImageURL {
    func url(of TaskID: Int, width: CGFloat, height: CGFloat) -> URL?
}

extension AsyncImageURL {
    func url(of TaskID: Int, width: CGFloat, height: CGFloat) -> URL? {
        URL(string: NetworkAPIClient.baseUrl + "id/\(TaskID)/\(Int(width))/\(Int(height))")
    }
}
