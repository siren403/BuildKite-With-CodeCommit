if exist codecommit-buildkite.zip del /f codecommit-buildkite.zip

zip.exe -r ./codecommit-buildkite.zip ./index.js ./node_modules/axios ./node_modules/debug ./node_modules/follow-redirects ./node_modules/is-buffer ./node_modules/ms