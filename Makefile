all: clean  translate-and-build

translate-and-build:
	@echo " "
	@echo "Making translation files"
	@echo "========================="
	- @mmg -r -y -vv || true
	@echo " "
	@echo "Moving files to build directory"
	@echo "========================="
	@python src/build/copy.py
	@cp src/mkdocs-prod.yml build/mkdocs.yml
	@cp src/mkdocs-base.yml build/mkdocs-base.yml
	@echo " "
	@echo "Done"
	@echo " "
	@echo " "
	@echo "Building sources"
	@echo "========================="
	@mkdocs build -f build/mkdocs.yml
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