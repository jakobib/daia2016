NAME  = finding-availability
ABOUT = metadata.yml

PANDOC = $(shell which pandoc)
ifeq ($(PANDOC),)
	PANDOC = $(error pandoc with pandoc-citeproc is required but not installed)
endif

# FIXME: https://github.com/jgm/pandoc-citeproc/issues/81
#	   --csl council-of-science-editors-author-date.csl \
	
$(NAME).html: $(ABOUT) $(NAME).md $(NAME).bib
	@$(PANDOC) -s -S -t html5 $(ABOUT) $(NAME).md \
	   --template code4lib.html \
	   --bibliography $(NAME).bib \
	   --css code4lib.css \
	   | sed 's/^<hr \/>/<h1>Endnotes<\/h1>/' > $@
