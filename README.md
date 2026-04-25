# 🧪 Gestão de Testes — GitHub (Gratuito)

Estrutura completa de gestão de testes integrada ao GitHub, sem custo adicional.
Funciona em conjunto com o Jira via convenção de commits e links.

---

## 📁 Estrutura do Repositório

```
.github/
  ISSUE_TEMPLATE/
    test-case.yml         # Template para registrar casos de teste
    test-failure.yml      # Template para reportar falhas
  workflows/
    test-suite.yml        # CI: roda, reporta e abre issues automaticamente
  PULL_REQUEST_TEMPLATE.md # Checklist de QA em todo PR

docs/
  test-plans/
    TEMPLATE-plano-de-teste.md  # Template de plano de teste por feature

tests/
  unit/                   # Testes unitários
  integration/            # Testes de integração
  e2e/                    # Testes end-to-end (Playwright / Cypress)

setup-labels.sh           # Script para criar todas as labels de QA
```

---

## 🚀 Setup Inicial (5 minutos)

### 1. Criar as labels
```bash
# Instale o GitHub CLI: https://cli.github.com
gh auth login
chmod +x setup-labels.sh
./setup-labels.sh SEU-ORG/SEU-REPO
```

### 2. Criar o Project (Kanban)
1. Acesse **github.com/SEU-ORG/SEU-REPO/projects** → New Project → Board
2. Crie as colunas:
   - 📋 **Backlog**
   - ▶️ **Em execução**
   - 🚧 **Bloqueado**
   - ✅ **Passou**
   - ❌ **Falhou**
3. Configure automação: Issues com label `test-fail` → coluna **Falhou**

### 3. Configurar Milestones por Sprint
```
github.com/SEU-ORG/SEU-REPO/milestones → New Milestone
Nome: Sprint 01 | Due date: DD/MM/AAAA
```

---

## 📋 Fluxo de Trabalho

### Criando um caso de teste
1. Issues → New Issue → **🧪 Caso de Teste**
2. Preencha o template (tipo, prioridade, passos, resultado esperado)
3. Adicione ao Project e ao Milestone da sprint
4. Se automatizado, informe o arquivo de teste

### Executando um ciclo
1. Mova as Issues para **Em execução** no Kanban
2. Execute os testes (manual ou via Actions)
3. Atualize o status no Kanban:
   - Passou → label `test-pass`
   - Falhou → label `test-fail` + abra Issue com **❌ Falha de Teste**
4. Ao fim da sprint, feche o Milestone e documente na Wiki

### Convenção de commits (link com Jira)
```
feat(PROJ-123): adicionar validação de CPF
test(PROJ-123): adicionar caso de teste para CPF inválido
fix(PROJ-123): corrigir regex de validação
```

---

## 🤖 O que o GitHub Actions faz automaticamente

| Gatilho | Ação |
|---------|------|
| Push / PR | Roda unit, integration e E2E tests |
| Qualquer resultado | Publica relatório na aba **Checks** |
| PR aberto | Comenta tabela de resultados no PR |
| Falha na `main` | Abre Issue automaticamente com link do run |

---

## 🏷 Labels de QA

| Label | Uso |
|-------|-----|
| `test-case` | Todo caso de teste documentado |
| `regression` | Teste de regressão |
| `smoke` | Smoke test — caminho feliz |
| `e2e` | Teste end-to-end |
| `test-pass` | Executado com sucesso |
| `test-fail` | Falhou na execução |
| `test-blocked` | Bloqueado por dependência |
| `automated` | Coberto por automação |
| `to-automate` | Candidato para automação |
| `ci-failure` | Falha detectada no CI |
| `priority:high/medium/low` | Prioridade do caso |

---

## 📊 Métricas de Qualidade (via GitHub)

- **Issues fechadas no Milestone** → taxa de aprovação do ciclo
- **Issues com label `test-fail`** → bugs por sprint
- **Insights → Issues** → tendência de qualidade ao longo do tempo
- **Actions → Checks** → histórico de builds e falhas

---

## 🔗 Integração com Jira

Sem plugin pago. Use:
1. **Commit com ID do Jira** → visível no histórico da Issue
2. **Link manual na Issue** → campo "ID do Jira" no template
3. **Branch nomeada com ID** → `feature/PROJ-123-login-cpf`

> Para integração automática bidirecional, o Jira oferece a integração nativa
> gratuita com GitHub em: **Jira → Apps → GitHub for Jira**

---

*Dúvidas? Abra uma Issue com a label `test-case`. 🚀*
