# Root convenience wrapper — the thesis build lives in master/
all clean open watch:
	$(MAKE) -C master $@
.PHONY: all clean open watch
