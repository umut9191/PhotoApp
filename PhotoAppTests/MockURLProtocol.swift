//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Macintosh on 12.03.2022.
//

import Foundation

//We will make urlSession to use this class to make return pre defined data.
class MockURLProtocol: URLProtocol {
    static var stubResponseData:Data?
    static var error: Error?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        if let signupErrorx = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signupErrorx)
        }else{
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {
        
    }
}
