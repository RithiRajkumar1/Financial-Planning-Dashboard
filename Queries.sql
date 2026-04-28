-- ============================================================
-- Financial Planning Dashboard - SQL Queries
-- Author: Rithi Rajkumar
-- ============================================================


-- QUERY 1: Budget vs Actuals by Department
-- ============================================================

SELECT
    d.department_name,
    d.cost_center_code,
    f.fiscal_year,
    f.fiscal_month,

    SUM(f.budget_amount)                          AS total_budget,
    SUM(f.actual_amount)                          AS total_actuals,

    SUM(f.actual_amount) - SUM(f.budget_amount)   AS variance_absolute,

    ROUND(
        ((SUM(f.actual_amount) - SUM(f.budget_amount))
        / NULLIF(SUM(f.budget_amount), 0)) * 100, 2
    )                                             AS variance_pct,

    CASE
        WHEN ROUND(
            ((SUM(f.actual_amount) - SUM(f.budget_amount))
            / NULLIF(SUM(f.budget_amount), 0)) * 100, 2
        ) < -10 THEN 'OVER BUDGET'
        WHEN ROUND(
            ((SUM(f.actual_amount) - SUM(f.budget_amount))
            / NULLIF(SUM(f.budget_amount), 0)) * 100, 2
        ) > 10  THEN 'UNDER SPEND'
        ELSE 'ON TRACK'
    END                                           AS budget_status

FROM financial_data f
JOIN departments d ON f.department_id = d.department_id
WHERE f.fiscal_year = YEAR(CURRENT_DATE)
GROUP BY
    d.department_name,
    d.cost_center_code,
    f.fiscal_year,
    f.fiscal_month
ORDER BY
    f.fiscal_month,
    d.department_name;


-- QUERY 2: Month over Month Trend
-- ============================================================

SELECT
    d.department_name,
    f.fiscal_year,
    f.fiscal_month,

    SUM(f.actual_amount)                          AS monthly_actuals,

    LAG(SUM(f.actual_amount), 1) OVER (
        PARTITION BY d.department_name
        ORDER BY f.fiscal_year, f.fiscal_month
    )                                             AS prev_month_actuals,

    ROUND(
        ((SUM(f.actual_amount) - LAG(SUM(f.actual_amount), 1) OVER (
            PARTITION BY d.department_name
            ORDER BY f.fiscal_year, f.fiscal_month
        )) / NULLIF(LAG(SUM(f.actual_amount), 1) OVER (
            PARTITION BY d.department_name
            ORDER BY f.fiscal_year, f.fiscal_month
        ), 0)) * 100, 2
    )                                             AS mom_change_pct

FROM financial_data f
JOIN departments d ON f.department_id = d.department_id
GROUP BY
    d.department_name,
    f.fiscal_year,
    f.fiscal_month
ORDER BY
    d.department_name,
    f.fiscal_year,
    f.fiscal_month;


-- QUERY 3: Rolling 3 Month Forecast
-- ============================================================

WITH monthly_spend AS (
    SELECT
        department_id,
        fiscal_year,
        fiscal_month,
        SUM(actual_amount) AS monthly_actuals
    FROM financial_data
    GROUP BY department_id, fiscal_year, fiscal_month
),
rolling_avg AS (
    SELECT
        department_id,
        fiscal_year,
        fiscal_month,
        monthly_actuals,
        ROUND(
            AVG(monthly_actuals) OVER (
                PARTITION BY department_id
                ORDER BY fiscal_year, fiscal_month
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            ), 2
        ) AS rolling_3m_forecast
    FROM monthly_spend
)
SELECT
    d.department_name,
    r.fiscal_year,
    r.fiscal_month,
    r.monthly_actuals,
    r.rolling_3m_forecast,
    ROUND(r.rolling_3m_forecast * 3, 2) AS quarterly_forecast_estimate
FROM rolling_avg r
JOIN departments d ON r.department_id = d.department_id
ORDER BY d.department_name, r.fiscal_year, r.fiscal_month;
