#!/bin/bash

xcodebuild -workspace SmoothWebView.xcworkspace -scheme SmoothWebView -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' test | xcpretty -c && exit ${PIPESTATUS[0]}

