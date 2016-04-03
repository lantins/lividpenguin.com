SCSS_FILES := $(shell find sass -type f -name *.scss)
CSS_FILES := $(patsubst sass/%,static/css/%,$(SCSS_FILES:.scss=.css))

all: clean assets build

build: assets
	hugo

static/css/%.css: sass/%.scss
	sassc --style compressed $< $@

assets: $(CSS_FILES)
	# bump 'last update' in humans.txt
	sed -i '' "s|\(Last update:\)\(.*\)|\1 `date +'%Y/%m/%d'`|" static/humans.txt

deploy:

serve:
	forego start

clean:
	rm -rf $(CSS_FILES)
	rm -rf public/

.PHONY: all build assets deploy serve clean
