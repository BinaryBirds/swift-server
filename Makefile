install:
	swift build -c release && install .build/release/swift-server /usr/local/bin/swift-server
