HOST:=$(shell hostname)
ifneq (,$(filter bytemark,$(HOST)))
  SITEFILE=theme/base.html.bytemark
else
  ifneq (,$(filter mythic,$(HOST)))
    SITEFILE=theme/base.html.mythic
  else
    SITEFILE=theme/base.html.local
  endif
endif

site/index.html: docs/*.md
	cat theme/base.html.head $(SITEFILE) theme/base.html.tail > theme/base.html
	mkdocs build

clean:
	rm -f theme/base.html
	rm -rf site
