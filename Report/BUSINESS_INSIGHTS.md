# FulfillIQ — Business Insights & Findings

This document summarizes the findings reported in the existing project guide and the saved outputs visible in ML notebooks 07 and 08. It separates descriptive findings, preliminary model-validation results and recommendations that still need testing.

## 1. Dataset snapshot

| Measure | Reported value | How to interpret it |
|---|---:|---|
| Original records | 180,519 | Processed rows; they are not all unique orders |
| Original features | 53 | As reported in the project guide |
| Processed ML-audit columns | 103 | Includes engineered/processed columns before the modelling feature filter |
| Distinct `Order Id` values | 65,752 | Reported by notebook 07 |
| ML audit date range | 2015-01-01 to 2018-01-31 | Coverage in the processed file used by notebook 07 |
| Features retained for modelling | 39 | 32 numeric/flag and 7 categorical features after the notebook's filters; feature availability still needs review |

## 2. Delivery performance findings

### 2.1 The reported late-delivery rates need reconciliation

Two different rates appear in the project materials:

- The original analytics/interview guide reports a late-delivery rate of approximately **57.28%**.
- ML notebook 07 reports **54.83%** prevalence for the `Late_delivery_risk` target (45.17% target-negative).

Do not present these as the same KPI until the source version, filter logic and denominator are checked. One calculation may be row-level while another may use a different definition or denominator. Because the dataset contains repeated `Order Id` values, every published rate should say whether it is calculated across rows/order items or distinct orders.

### 2.2 The target label is not a perfect match to observed actual-versus-scheduled duration

Notebook 07 compares `Late_delivery_risk` with the indicator:

`Days for shipping (real) > Days for shipment (scheduled)`

The two agree on **97.55% of rows**. The audit shows 4,423 rows where `Late_delivery_risk` is 1 even though actual shipping days are not greater than scheduled days; the reverse mismatch count is 0 in that comparison.

**Interpretation:** the label is strongly aligned with the duration comparison, but not identical. The current model predicts the dataset's `Late_delivery_risk` field. Confirm the intended business definition before describing it as a definitive prediction of actual late arrival.

### 2.3 Late-risk flag rate varies by shipping mode

Notebook 07 reports the following row-level rates. The counts below are rows in the processed dataset, not distinct order counts.

| Shipping mode | Rows in group | `Late_delivery_risk` rate |
|---|---:|---:|
| First Class | 27,814 | 95.3% |
| Second Class | 35,216 | 76.6% |
| Same Day | 9,737 | 45.7% |
| Standard Class | 107,752 | 38.1% |

Shipping mode is therefore a strong segment for investigating how the dataset's risk labels vary. These figures do **not** prove that shipping mode causes delay: service promises, routes, destination, order mix and other factors may also matter. Validate definitions and sample sizes before recommending a change to shipping policy.

### 2.4 Statistical association

The original project guide reports that Shipping Mode had the strongest observed categorical association with late-delivery flags among the tested categorical variables, with **Cramér's V around 0.433**. The guide also reports much smaller values for region (about 0.020), category (about 0.016), holiday (about 0.003) and weekend (about 0.001).

**Interpretation:** shipping mode is a reasonable priority for deeper investigation. Cramér's V measures association; it does not show that changing shipping mode alone will reduce late deliveries.

## 3. Profitability and commercial analysis

The project's existing SQL, Python and Power BI analysis brings revenue, total profit and margin together. The key business questions include:

- Which markets generate high revenue but relatively weak profit margin?
- Which products have high profit, and which have negative profit?
- How are revenue, profit and margin distributed across discount bands?
- Which customers contribute sales, profit and order activity?
- How does performance change by region and over time?

The project guide reports these overall indicators:

| Indicator | Reported value | Caution |
|---|---:|---|
| Overall profit margin | Approximately 10.8% | Validate the calculation; grouped SQL uses `SUM(profit) / SUM(sales) × 100` |
| Average order value (AOV) | Approximately 559.45 | Confirm units/currency and use sales divided by distinct order count with a compatible numerator/denominator |
| Average shipping time | Approximately 3.50 days | Confirm whether this is the mean of actual shipping days and which records are included |
| Extreme-profit observations flagged | Approximately 18,942 | Flagged by an IQR-style rule; this does not mean they are all data errors |

### How to use these findings

- Review high-revenue/low-margin markets for pricing, discount, product-mix and operating explanations.
- Investigate products with negative profit before deciding whether a pricing, promotion or assortment change is justified.
- Consider both sales and profit when evaluating customer and product value; revenue alone is not sufficient.
- Treat IQR-flagged extremes as candidates for investigation, not automatic deletions.

The supplied project guide does not provide verified exact rankings, per-market margin values or statistically confirmed discount effects in the summary. Do not add named top/bottom markets or numerical causal claims unless you extract and verify the corresponding result tables.

## 4. Time-trend and dashboard observations

The existing project guide describes a sharp drop at the end of the monthly revenue trend around the final period of the dataset. The guide recommends checking whether the last period is incomplete, dates are missing, or the extract is truncated before calling it a real business decline.

The five Power BI dashboard areas are:

1. Executive Overview
2. Delivery Performance
3. Profitability Analysis
4. Customer & Product Analysis
5. Regional & Operational Analysis

The dashboard connects high-level KPIs with more focused investigations. Before presenting the dashboard, make sure SQL and Power BI measures use consistent filters, metric definitions and denominators, and correct any known chart-label encoding or missing-bar issues.

## 5. Machine learning findings — preliminary validation only

### 5.1 Evaluation setup

Notebook 07 creates chronological splits and keeps order IDs within one split:

| Split | Rows | Date range shown by notebook 07 | Target prevalence |
|---|---:|---|---:|
| Train | 122,752 | 2015-01-01 to 2016-12-17 | 54.91% |
| Validation | 21,664 | 2016-12-17 to 2017-04-22 | 54.69% |
| Test | 36,103 | 2017-04-22 to 2018-01-31 | 54.65% |

The split boundaries are chronological. Notebook 08 uses only the train and validation periods and saves the selected candidate model for the next evaluation stage. Its output does not provide final test results.

### 5.2 Candidate model comparison

Validation results recorded in notebook 08:

| Candidate | Cross-validation ROC-AUC | Validation ROC-AUC | Validation PR-AUC | Validation Brier score | Recall at 80% precision |
|---|---:|---:|---:|---:|---:|
| Majority-class baseline | — | 0.5000 | 0.5469 | 0.2478 | 0.0000 |
| Planner rule (shipping mode + scheduled days) | — | 0.7264 | 0.7463 | 0.1974 | 0.5353 |
| Tuned Logistic Regression | 0.7409 ± 0.0050 | **0.7320** | **0.8093** | 0.1977 | 0.5730 |
| Tuned Random Forest | 0.7405 ± 0.0048 | 0.7294 | 0.8085 | **0.1963** | 0.5731 |
| Histogram Gradient Boosting | 0.7326 ± 0.0067 | 0.7264 | 0.8029 | 0.2027 | 0.5634 |

*Metric note:* a higher ROC-AUC generally means better ranking separation; PR-AUC is useful when focusing on the positive class; a lower Brier score is better for probabilistic predictions. Results should be interpreted together, not as a single score.

### 5.3 Why Logistic Regression was selected

Notebook 08 selects tuned Logistic Regression (best parameter `C = 10.0`) under its documented rule:

- It had the highest validation ROC-AUC among the compared candidates (0.7320).
- Its validation ROC-AUC gain over the planner-rule baseline was **0.0056**.
- The train-to-validation ROC-AUC gap was 0.0142, smaller than the reported gaps for the tuned Random Forest (0.0532) and Histogram Gradient Boosting (0.1646).
- The validation gains are modest. The selection supports advancing this candidate to final evaluation; it does not yet establish production readiness.

### 5.4 Required checks before treating the model as reliable

1. Reconcile the target label with the business definition of an actual late delivery.
2. Recheck whether every retained feature is known at order placement. In particular, review profit-derived features such as `Benefit per order`, `Order Item Profit Ratio`, `is_profit_outlier`, `loss_order_flag` and `profit_category`. A single-feature AUC scan is a diagnostic, not proof of feature safety.
3. Run notebook 09 on the untouched test period after the target and feature set are finalized.
4. Report test-period metrics, threshold choice, confusion matrix and error analysis only after that run.
5. If using risk scores to prioritize a limited review queue, compare against a baseline and explicitly state the capacity and assumptions. No actual operational savings have been measured in the current project evidence.

## 6. Business recommendations supported by the analysis

These are proposed actions to investigate, not outcomes already achieved:

- **Delivery operations:** investigate elevated risk-label patterns by shipping mode and market, then validate the role of routes, carriers, promised service levels and destination mix.
- **Profitability:** investigate high-revenue/low-margin and loss-making segments with revenue, profit, margin and discount measures together.
- **Customer/product decisions:** combine customer and product value measures rather than ranking by sales alone.
- **Reporting quality:** align SQL, Python and Power BI definitions, clearly label row-level versus order-level rates and include sample counts.
- **Risk prioritization:** after leakage review and final test evaluation, assess whether a top-risk-order queue captures more late-flag records than a simple shipping rule.

## 7. Limitations and reporting discipline

- The project uses a historical benchmark dataset, so patterns may not generalize to every business.
- The 57.28% reported analytics late rate and 54.83% ML target prevalence differ and must not be conflated.
- The modelling rows are order-item records; use distinct orders when the business KPI is order-level.
- Shipping mode association is not causal proof.
- The current saved model results are validation results, not final test results.
- Retained feature availability at order placement still needs a full business-definition check.
- The source project guide says the dataset lacks a direct shipping-cost field; do not claim measured shipping-cost savings.
- Do not claim deployment, reduced delays or realized financial benefit unless implemented and measured.

## 8. Summary

FulfillIQ combines descriptive and diagnostic analytics, statistical investigation, SQL business analysis and Power BI reporting, with a developing ML workflow for the `Late_delivery_risk` label. The strongest current evidence is that delivery-risk labels differ substantially by shipping mode in this dataset, profitability needs to be analyzed alongside revenue, and Logistic Regression modestly outperformed the planner-rule baseline on validation ROC-AUC. The next step is to finish the target/feature audit and final test evaluation before making claims about operational performance.
