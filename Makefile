
build: clean uhc-datapack.zip


uhc-datapack.zip: datapack always_rebuild
	cd datapack && zip -r ../$@ *

clean:
	rm uhc-datapack.zip

always_rebuild: