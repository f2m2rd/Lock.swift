// ConnectionErrorPresenterSpec.swift

//
// Copyright (c) 2016 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Quick
import Nimble

@testable import Lock

class ConnectionErrorPresenterSpec: QuickSpec {

    override func spec() {

        var presenter: ConnectionErrorPresenter!
        var navigator: MockNavigator!
        var error: RemoteConnectionLoaderError!
        var view: ConnectionErrorView!

        beforeEach {
            error = RemoteConnectionLoaderError.connectionTimeout
            navigator = MockNavigator()
            presenter = ConnectionErrorPresenter(error: error, navigator: navigator)
            view = presenter.view as? ConnectionErrorView
        }

        describe("init") {

            it("should build ConnectionErrorView") {
                expect(presenter.view as? ConnectionErrorView).toNot(beNil())
            }

            it("should have button title") {
                expect(view.primaryButton?.title) == "Retry"
            }

            it("should diplay relevant error message") {
                expect(view.label?.text) == error.localizableMessage
            }
        }

        describe("action") {

            it("should trigger retry on button press") {
                view.primaryButton?.onPress(view.primaryButton!)
                expect(navigator.route) == Route.root
            }

        }

    }
}
