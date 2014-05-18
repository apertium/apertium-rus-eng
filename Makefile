all: en-ru.t1x.bin en-ru.t2x.bin en-ru.t3x.bin ru-en.t1x.bin ru-en.t2x.bin ru-en.t3x.bin 
	lt-comp lr apertium-ru-en.ru.dix ru-en.automorf.bin
	lt-comp lr apertium-ru-en.en.dix en-ru.automorf.bin

	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc lexchoicebil.xsl apertium-ru-en.ru-en.dix > .deps/apertium-ru-en.ru-en.dix
	apertium-validate-dictionary .deps/apertium-ru-en.ru-en.dix
	lt-comp lr .deps/apertium-ru-en.ru-en.dix ru-en.autobil.bin
	lt-comp rl .deps/apertium-ru-en.ru-en.dix en-ru.autobil.bin
	
	lt-comp rl apertium-ru-en.en.dix ru-en.autogen.bin
	lt-comp rl apertium-ru-en.ru.dix en-ru.autogen.bin

	if [ ! -L apertium-ru-en.ru-en.rlx ]; then ln -s ../apertium-kv-ru/apertium-kv-ru.ru-kv.rlx apertium-ru-en.ru-en.rlx; fi
	cg-comp apertium-ru-en.ru-en.rlx ru-en.rlx.bin
	cg-comp apertium-ru-en.ru-en.lex ru-en.lex.bin

	apertium-gen-modes modes.xml
	cp *.mode modes/

en-ru.t1x.bin:
	apertium-validate-transfer apertium-ru-en.en-ru.t1x
	apertium-preprocess-transfer apertium-ru-en.en-ru.t1x $@

en-ru.t2x.bin: 
	apertium-validate-interchunk apertium-ru-en.en-ru.t2x
	apertium-preprocess-transfer apertium-ru-en.en-ru.t2x $@

en-ru.t3x.bin: 
	apertium-validate-postchunk apertium-ru-en.en-ru.t3x
	apertium-preprocess-transfer apertium-ru-en.en-ru.t3x $@

ru-en.t1x.bin:
	apertium-validate-transfer apertium-ru-en.ru-en.t1x
	apertium-preprocess-transfer apertium-ru-en.ru-en.t1x $@

ru-en.t2x.bin: 
	apertium-validate-interchunk apertium-ru-en.ru-en.t2x
	apertium-preprocess-transfer apertium-ru-en.ru-en.t2x $@

ru-en.t3x.bin: 
	apertium-validate-postchunk apertium-ru-en.ru-en.t3x
	apertium-preprocess-transfer apertium-ru-en.ru-en.t3x $@


clean:
	rm *.bin
