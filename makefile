tmpbookdir=/tmp/ks-book

.PHONY: deploy
deploy : book
	./.deploy ${tmpbookdir}
