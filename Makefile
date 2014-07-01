JSSOURCES=$(shell find lib tests -name '*.js' -print)
JSTESTS=$(shell find tests -name '*.js' -print)

default: bundle

bundle: 
	browserify $(JSTESTS) -o bundle/promises-es6-tests.js

prepublish: no-dos-endings bundle

lint: jslint 

jslint:
	jslint --terse $(JSSOURCES)

no-dos-endings:
	file $(JSSOURCES) | grep -v CRLF > /dev/null

clean:
	-find . -name "*~" | xargs rm

.PHONY: install jslint cpplint cpptest jstest doc no-dos-endings check-coverage build tags clean bundle
