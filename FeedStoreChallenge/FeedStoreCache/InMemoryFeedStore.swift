//
//  InMemoryFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Victor Sousa on 18/04/2020.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation

public class InMemoryFeedStore: FeedStore {

    private var feed: [LocalFeedImage]?
    private var timestamp: Date?

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        self.feed = nil
        self.timestamp = nil
        completion(.none)
    }

    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        self.feed = feed
        self.timestamp = timestamp
        completion(.none)
    }

    public func retrieve(completion: @escaping RetrievalCompletion) {
        guard let feed = self.feed, let timestamp = self.timestamp else {
            completion(.empty)
            return
        }
        completion(.found(feed: feed, timestamp: timestamp))
    }
}
