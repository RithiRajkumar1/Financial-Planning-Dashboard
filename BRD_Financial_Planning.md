# Business Requirements Document (BRD)
## Financial Planning & Forecasting Dashboard

**Author:** Rithi Rajkumar | **Date:** April 2025 | **Status:** Approved

---

## 1. Executive Summary

The Finance team currently relies on manual Excel consolidations to track budget vs actuals, resulting in delayed reporting and limited visibility into departmental spend. This project delivers a centralized financial planning dashboard that automates variance tracking, supports forecasting, and enables data-driven decisions.

---

## 2. Business Objectives

- Reduce monthly financial reporting cycle from 5 days to 1 day
- Provide real-time visibility into budget consumption across departments
- Enable proactive identification of cost overruns before quarter-end
- Standardize financial KPIs across business units

---

## 3. Stakeholders

| Stakeholder | Role | Interest |
|-------------|------|----------|
| CFO | Executive Sponsor | Strategic financial oversight |
| Finance Manager | Primary User | Monthly reporting and forecasting |
| Department Heads | Secondary Users | Own department spend tracking |
| IT / Data Team | Technical Owner | Data pipeline and system integration |
| Business Analyst | Requirements Owner | Bridging business and technical needs |

---

## 4. Scope

### In Scope
- Budget vs actuals tracking at department and cost-center level
- Variance calculation in absolute and percentage terms
- Monthly, quarterly, and annual aggregation
- Rolling 3-month forecast based on historical spend
- Automated alerts for variance thresholds exceeding 10%

### Out of Scope
- Integration with ERP systems (Phase 2)
- Headcount and HR cost tracking
- Multi-currency support

---

## 5. Business Requirements

| ID | Requirement | Priority |
|----|-------------|----------|
| BR-01 | Display actual vs budgeted spend by department | High |
| BR-02 | Calculate variance in absolute and percentage terms | High |
| BR-03 | Support monthly and quarterly aggregation | High |
| BR-04 | Allow drill-down by cost center | Medium |
| BR-05 | Generate rolling 3-month forecast | Medium |
| BR-06 | Flag departments exceeding 10% negative variance | High |
| BR-07 | Export reports to Excel and PDF | Medium |
| BR-08 | Display YTD cumulative spend | High |

---

## 6. Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Data quality issues from ERP exports | Medium | High | Data validation layer before ingestion |
| Stakeholder misalignment on KPIs | High | Medium | Requirement workshops with sign-off |
| Delayed IT resources | Medium | High | Early IT engagement and phased delivery |

---

## 7. Success Criteria

- Finance team generates monthly report in under 10 minutes
- Dashboard adopted by all department heads within 30 days
- Zero manual Excel consolidations required post-implementation
- Forecast accuracy within 5% of actuals
