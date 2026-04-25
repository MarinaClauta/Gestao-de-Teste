#!/usr/bin/env bash
# setup-labels.sh
# Cria todas as labels de QA no repositório GitHub
# Uso: ./setup-labels.sh OWNER/REPO
#
# Dependência: GitHub CLI (gh) instalado e autenticado
# Instale com: https://cli.github.com

set -e

REPO="${1:-$(gh repo view --json nameWithOwner -q .nameWithOwner)}"

if [ -z "$REPO" ]; then
  echo "Uso: $0 OWNER/REPO"
  exit 1
fi

echo "🏷  Criando labels de QA em: $REPO"
echo ""

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if gh label list --repo "$REPO" | grep -q "^$name"; then
    gh label edit "$name" --repo "$REPO" --color "$color" --description "$description" 2>/dev/null && \
      echo "  ✏️  Atualizada: $name" || echo "  ⚠️  Ignorada:  $name"
  else
    gh label create "$name" --repo "$REPO" --color "$color" --description "$description" 2>/dev/null && \
      echo "  ✅ Criada:    $name" || echo "  ⚠️  Ignorada:  $name"
  fi
}

echo "── Tipo de teste ──────────────────────────────"
create_label "test-case"      "7057FF" "Caso de teste documentado"
create_label "regression"     "E4E669" "Teste de regressão"
create_label "smoke"          "BFD4F2" "Smoke test — caminho feliz"
create_label "e2e"            "0075CA" "Teste end-to-end"
create_label "integration"    "006B75" "Teste de integração"
create_label "unit"           "C5DEF5" "Teste unitário"
create_label "performance"    "D4C5F9" "Teste de performance"
create_label "accessibility"  "FEF2C0" "Teste de acessibilidade"

echo ""
echo "── Status de execução ─────────────────────────"
create_label "test-pass"      "0E8A16" "Teste executado com sucesso"
create_label "test-fail"      "D73A4A" "Teste falhou"
create_label "test-blocked"   "E99695" "Execução bloqueada"
create_label "test-skip"      "CCCCCC" "Teste ignorado neste ciclo"
create_label "ci-failure"     "B60205" "Falha detectada no CI/CD"

echo ""
echo "── Automação ──────────────────────────────────"
create_label "automated"      "28A745" "Teste automatizado"
create_label "manual-only"    "F9D0C4" "Apenas execução manual"
create_label "to-automate"    "FFC107" "Candidato para automação"

echo ""
echo "── Prioridade ─────────────────────────────────"
create_label "priority:high"   "D73A4A" "Prioridade alta"
create_label "priority:medium" "FBCA04" "Prioridade média"
create_label "priority:low"    "0075CA" "Prioridade baixa"

echo ""
echo "✅ Todas as labels foram configuradas em $REPO"
echo ""
echo "Próximos passos:"
echo "  1. Acesse github.com/$REPO/issues/labels para conferir"
echo "  2. Crie um Project em github.com/$REPO/projects"
echo "  3. Configure as colunas: Backlog → Em execução → Bloqueado → Passou → Falhou"
