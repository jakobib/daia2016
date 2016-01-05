NAME  = finding-availability
ABOUT = metadata.yml

PANDOC = $(shell which pandoc)
ifeq ($(PANDOC),)
	PANDOC = $(error pandoc with pandoc-citeproc is required but not installed)
endif

REFERENCES=references.bib

$(NAME).html: $(ABOUT) $(NAME).md $(REFERENCES)
	@$(PANDOC) -s -S -t html5 $(ABOUT) $(NAME).md \
	   --template code4lib.html \
	   --bibliography $(REFERENCES) \
	   --csl council-of-science-editors-author-date.csl \
	   --css code4lib.css \
	   | sed 's/^<hr \/>/<h1>Endnotes<\/h1>/' > $@

normalize: $(REFERENCES)
	catmandu convert BibTeX --file $< to BibTeX --file $<
