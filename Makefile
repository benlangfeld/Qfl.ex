website:
	mix docs
	if [ ! -d "gh-pages" ]; then git clone $(shell git config --get remote.origin.url) gh-pages; cd gh-pages; git checkout origin/gh-pages -b gh-pages; git branch -d master; fi
	rm -rf gh-pages/doc
	cp -r doc gh-pages/doc
	cd gh-pages; git add *; git commit -a -m "Update docs"; git push
