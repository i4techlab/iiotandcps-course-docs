all: translate_files build_docs

translate_files:
	@echo "Making translation files"
	@echo "========================="
	@mmg -r -y
	@echo " "
	@echo "Moving files to build directory"
	@echo "========================="
	@python src/build/copy.py
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

serve:
	@echo "Serve mkdocs"
	@echo "========================="
	@mkdocs serve -f build/mkdocs.yml
