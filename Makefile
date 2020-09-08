default: render rebuild restart

render:
	tutor config render --extra-config ./config.yml ./theme "$$(tutor config printroot)/env/build/openedx/themes/enrich"

watch: render
	while true; do inotifywait -e modify --recursive config.yml ./theme; $(MAKE) render; done

rebuild:
	tutor images build openedx

restart: tutor local stop && tutor local start -d