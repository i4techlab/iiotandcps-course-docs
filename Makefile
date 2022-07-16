all: translate_files build_docs

test: translate_files serve

translate_files:
	@echo "Making translation files"
	@echo "========================="
	@mmg -r -y
	@echo " "
	@echo "Moving files to build directory"
	@echo "========================="
	@py src/build/copy.py
	@cp src/build/mkdocs.yml build/mkdocs.yml
	@echo " "
	@echo "Done"

build_docs:
	@echo "Building sources"
	@echo "========================="
	@mkdocs build -f build/mkdocs.yml
	@echo " "
	@echo "Done"

dev:
	@echo "Serve mkdocs"
	@echo "========================="
	@mkdocs serve -f src/mkdocs.yml

serve_build:
	@echo "Serve mkdocs"
	@echo "========================="
	@mkdocs serve -f build/mkdocs.yml
