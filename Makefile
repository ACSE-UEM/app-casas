# Visualização local dos protótipos HTML em galeria-temas/temas/spec-cursor-prototipos
.PHONY: prototipos-serve lint-spec

prototipos-serve:
	cd galeria-temas/temas/spec-cursor-prototipos && python3 -m http.server 8765 --bind 127.0.0.1

# Lint dos documentos da especificação, planos e governança (markdownlint via docker)
lint-spec:
	docker run --rm -v $(CURDIR):/workdir davidanson/markdownlint-cli2:latest "spec-final/*.md" "spec.md" "README.md" "plans/*.md" "VISION.md" "GOVERNANCE.md" "CONTRIBUTING.md" "docs/taxonomia-documentos.md" "manual/*.md"
