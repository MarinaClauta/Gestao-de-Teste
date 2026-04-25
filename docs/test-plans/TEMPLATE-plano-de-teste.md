# Plano de Teste — [Nome do Módulo/Feature]

> **Ciclo:** Sprint XX · **Versão:** X.X.X · **Responsável:** @usuario
> **Período:** DD/MM/AAAA → DD/MM/AAAA · **Jira Epic:** [PROJ-XXX](https://jira)

---

## 1. Escopo

### ✅ O que será testado
- Funcionalidade A
- Funcionalidade B
- Integração com serviço C

### ❌ O que está fora do escopo
- Funcionalidade D (não entrou nesta sprint)
- Performance sob carga (coberto por suite dedicada)

---

## 2. Estratégia

| Tipo | Ferramenta | Responsável | Cobertura meta |
|------|-----------|-------------|----------------|
| Unitário | Jest / pytest | Dev | 80%+ |
| Integração | Jest / pytest | Dev + QA | Fluxos críticos |
| E2E | Playwright / Cypress | QA | Happy path + erros |
| Manual | — | QA | Edge cases |

---

## 3. Casos de Teste

> Cada item abaixo é uma [Issue no GitHub](../../issues) com a label `test-case`.

| # | Issue | Tipo | Prioridade | Automatizado |
|---|-------|------|-----------|-------------|
| 1 | #XX — Login com credenciais válidas | Funcional | 🔴 Alta | ✅ |
| 2 | #XX — Login com senha errada | Funcional | 🔴 Alta | ✅ |
| 3 | #XX — Recuperação de senha | Funcional | 🟡 Média | ⏳ |
| 4 | #XX — Logout em múltiplas abas | Regressão | 🟡 Média | ❌ |

---

## 4. Critérios de Aceite

A feature estará aprovada quando:

- [ ] 100% dos casos de prioridade Alta passarem
- [ ] ≥ 90% dos casos de prioridade Média passarem
- [ ] Zero bugs de severidade Crítica em aberto
- [ ] Cobertura de testes unitários ≥ 80%
- [ ] Pipeline de CI passando na branch `main`

---

## 5. Ambientes

| Ambiente | URL | Dados |
|----------|-----|-------|
| Staging | https://staging.exemplo.com | Dados sintéticos |
| CI/CD | GitHub Actions | Mock / containers |

---

## 6. Riscos e Dependências

| Risco | Impacto | Mitigação |
|-------|---------|-----------|
| API externa instável | Alto | Usar mock nos testes automatizados |
| Dados de produção necessários | Médio | Solicitar anonimização com antecedência |

---

## 7. Resultados do Ciclo

> Preencher ao fim da sprint

| Métrica | Resultado |
|---------|-----------|
| Total de casos | — |
| Aprovados | — |
| Falharam | — |
| Bloqueados | — |
| Pulados | — |
| Taxa de aprovação | — % |
| Bugs abertos | — |
| Bugs críticos | — |

**Milestone no GitHub:** [Sprint XX](../../milestones/X)

---

## 8. Bugs Encontrados

| Issue | Severidade | Status |
|-------|-----------|--------|
| #XX — Descrição do bug | 🔴 Crítica | Aberto |

---

*Documento mantido na [Wiki do repositório](../../wiki). Dúvidas: abra uma Issue com a label `test-case`.*
