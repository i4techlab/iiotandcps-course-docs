all: clean translate build

translate:
	@echo " "
	@echo "Making translation files"
	@echo "========================="
	@mmg -r -y
	@echo " "
	@echo "Moving files to build directory"
	@echo "========================="
	@python src/build/copy.py
	@cp src/mkdocs-prod.yml build/mkdocs.yml
	@cp src/mkdocs-base.yml build/mkdocs-base.yml
	@echo " "
	@echo "Done"

build:
	@echo " "
	@echo "Building sources"
	@echo "========================="
	@mkdocs build -f build/mkdocs-prod.yml
	@echo " "
	@echo "Done"

dev:
	@echo " "
	@echo "Serve mkdocs"
	@echo "========================="
	@mkdocs serve -f src/mkdocs-base.yml

serve:
	@echo " "
	@echo "Serve mkdocs"
	@echo "========================="
	@mkdocs serve -f build/mkdocs.yml

clean:
	@echo " "
	@echo "Cleaning build directory"
	@echo "========================="
	@rm -rf build
	@echo " "
	@echo "Done"