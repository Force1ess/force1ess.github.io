server:
	hugo server -w -D
clean:
	rm -rf docs
build: clean
	hugo -d docs
commit : build
	git add .&& git commit
push:commit
	git push