ifneq ($(MAKECMDGOALS), clean)
$(firstword $(MAKECMDGOALS)):
	python3 basic_blocks.py `which $(firstword $(MAKECMDGOALS))` $(leaders)
endif

clean:
	rm basic_blocks.txt text_section.txt