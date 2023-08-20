server:
	hugo server -w -D
commit :
	git add .&& git commit
push:clean
	git push origin master
clean:
	rm -rf public