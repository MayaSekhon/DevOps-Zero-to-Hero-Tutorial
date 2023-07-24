# this is what executes if no argument is given
lint:
	mdl README.md

readme:
	mdl README.md
	git add README.md
	git commit -m "Updated readme" README.md
	git push
	open https://github.com/MayaSekhon/DevOps-Tutorial

.PHONY: makefile
makefile:
	git add Makefile
	git commit -m "Updated makefile" Makefile
	git push
	open https://github.com/MayaSekhon/DevOps-Tutorial/blob/main/Makefile

