if exist codecommit-buildkite.zip del /f codecommit-buildkite.zip

zip.exe -r ./codecommit-buildkite.zip ./index.js ./node_modules