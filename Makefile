server:
	hugo server -w -D
clean:
	rm -rf public
build:
	hugo
commit :clean build
	git add .&& git commit
push:commit
	git push origin master