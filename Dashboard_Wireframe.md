# Dashboard Wireframe & KPI Definitions
## Financial Planning & Forecasting Dashboard

---

## KPI Definitions

| KPI | Definition | Formula | Target |
|-----|-----------|---------|--------|
| Total Budget | Approved budget for period | SUM(budget_amount) | Set annually |
| Total Actuals | Actual spend for period | SUM(actual_amount) | Less than budget |
| Variance (£) | Difference between actuals and budget | Actuals - Budget | Less than 0 |
| Variance (%) | Percentage deviation from budget | (Variance / Budget) x 100 | Within 10% |
| YTD Spend | Cumulative actuals from start of year | Running SUM(actuals) | Less than YTD Budget |
| Rolling Forecast | Projected spend on 3-month average | AVG(last 3 months) | Less than Budget |

---

## Budget Status Logic

- 🔴 OVER BUDGET — Variance % less than -10%
- 🟡 AT RISK — Variance % between -5% and -10%
- 🟢 ON TRACK — Variance % within 5%
- 🔵 UNDER SPEND — Variance % more than +10%

---

## User Stories

| ID | As a... | I want to... | So that... |
|----|---------|-------------|-----------|
| US-01 | Finance Manager | View total budget vs actuals at a glance | I can assess financial health quickly |
| US-02 | Department Head | Filter dashboard by my department | I only see data relevant to me |
| US-03 | CFO | See departments flagged as over budget | I can intervene before quarter-end |
| US-04 | Finance Manager | View month-over-month spend trend | I can identify seasonal patterns |
| US-05 | Finance Manager | Export the report to Excel | I can share with stakeholders offline |
