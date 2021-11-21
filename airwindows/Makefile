.ONESHELL:
SHELL := /bin/bash
.SILENT: all

all:
	# Get hash of existing
	export AIRWINDOWS_OLD_HASH=""
	if test -f "WinVST64s.zip"; then \
	    export AIRWINDOWS_OLD_HASH=$$(checksum "WinVST64s.zip" -t=sha256)
	fi

	# Get latest zip of all VSTs and get hash of it
	echo "Getting latest source..."
	curl -L https://www.airwindows.com/wp-content/uploads/WinVST64s.zip --output WinVST64s.zip
	export AIRWINDOWS_NEW_HASH=$$(checksum "WinVST64s.zip" -t=sha256);

	# Compare hashes to decide if new package needs to be generated
	echo "New hash is $$AIRWINDOWS_NEW_HASH"
	echo "Old hash is $$AIRWINDOWS_OLD_HASH"
	if [ "$$AIRWINDOWS_OLD_HASH" = "$$AIRWINDOWS_NEW_HASH" ]; then
	    echo "Hash of newly downloaded and previous are the same, not building new package."
	else
	    echo "Hash of newly downloaded and previous aren't the same, building package and updating info..."
		# Package them
		@mv WinVST64s.zip ./tools/
		# Update date
		@export AIRWINDOWS_DL_DATE=$$(date +'%Y.%m.%d')
		@cp airwindows.nuspec-template airwindows.nuspec
		@sed -i "s/__AIRWINDOWS_VERSION__/$$AIRWINDOWS_DL_DATE/" airwindows.nuspec
	fi
	# Make chocolatey package
	choco pack

copy-to-dev:
	cp ./airwindows*.nupkg ../../chocolatey-test-environment/packages

.PHONY: all


