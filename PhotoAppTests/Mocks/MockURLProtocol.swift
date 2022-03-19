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
        if let signupErrorx = Self.error {
            //without changing error to NsError Error description unit test not worked
            //right now it is working
            let errorx = NSError(domain: "testingError", code: -99, userInfo: [NSLocalizedDescriptionKey: signupErrorx.localizedDescription])
            client?.urlProtocol(self, didFailWithError: errorx)
        }else{
            client?.urlProtocol(self, didLoad: Self.stubResponseData ?? Data())
            client?.urlProtocolDidFinishLoading(self)

        }
    }
    override func stopLoading() {
        
    }
}
