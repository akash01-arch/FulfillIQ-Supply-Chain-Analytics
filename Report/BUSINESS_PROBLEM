# FulfillIQ — Business Problem & Project Scope

**Project:** FulfillIQ — Supply Chain Delivery & Profitability Intelligence  
**Domain:** E-commerce, supply chain operations and commercial analytics  
**Dataset:** DataCo Global Supply Chain (historical benchmark dataset)  
**Tools used across the project:** Python, Pandas, NumPy, SciPy, scikit-learn, SQL and Power BI

## 1. Business context

An e-commerce business generates data about orders, products, customers, sales, profit, geography and shipping. However, collecting data alone does not tell managers where delivery problems are concentrated, which products or markets are profitable, or what should be investigated first.

FulfillIQ connects operational delivery indicators with commercial performance. The analytical work explores what happened and where patterns appear. The machine learning extension investigates whether the dataset's late-delivery risk flag can be predicted using information available at order placement.

## 2. Business problem statement

**How can historical supply chain data be turned into reliable insights about delivery risk and profitability, and can those insights help a business prioritize operational investigation?**

The project focuses on four related business needs:

1. **Delivery performance:** identify shipping modes, markets and regions where late-delivery flags are concentrated.
2. **Profitability:** distinguish high sales from high profit, and locate high-revenue/low-margin or loss-making segments for further investigation.
3. **Customer and product performance:** understand which customers and products contribute value and how performance differs across segments.
4. **Operational prioritization:** evaluate whether a machine learning model can rank records by the likelihood of the dataset's late-delivery risk label, using only features that are genuinely available at the chosen prediction time.

## 3. Questions the project investigates

### Delivery and operations
- How does the late-delivery risk flag vary by shipping mode, region, market and other available categories?
- Which combinations of shipping mode and market should be investigated further?
- Are the delivery labels consistent with the actual-versus-scheduled shipping-day fields?
- Can a model improve on a simple shipping-rule baseline when predicting the late-delivery risk flag?

### Sales and profitability
- Which markets and products contribute the most sales and profit?
- Which high-revenue segments have weak profit margins?
- Which products or orders have negative profit and deserve review?
- How do revenue, profit and margin vary across discount bands and over time?

### Customers and decision support
- Which customers contribute high sales, profit or repeat-purchase activity?
- Which products and customer segments should be reviewed together with delivery performance?
- How can SQL results and analytical findings be communicated clearly through a Power BI dashboard?

## 4. Dataset overview and grain

| Item | Project detail |
|---|---|
| Source | DataCo Global Supply Chain dataset |
| Original dataset summary | 180,519 records and 53 original features, as reported in the project guide |
| Processed data used by the ML audit | 180,519 rows and 103 columns before the modelling feature filter |
| Distinct `Order Id` values | 65,752, reported by ML notebook 07 |
| Date coverage in ML audit | 1 January 2015 to 31 January 2018 |
| Row meaning | The processed table is at order-item/record level; repeated order IDs are possible |
| Primary ML label | `Late_delivery_risk` |

**Grain matters:** 180,519 rows must not be described as 180,519 distinct orders. A business metric should state whether its denominator is rows/order items or distinct orders. The project should reconcile definitions before publishing one definitive late-delivery KPI.

## 5. Project workflow

### Business analytics phase

1. **01 — Data Understanding:** inspect the source, columns, date coverage, data types and record structure.
2. **02 — Data Cleaning:** inspect missing values, inconsistent formats/categories, duplicates and unusual values; document cleaning decisions.
3. **03 — Feature Engineering:** create reusable analytical measures and category/segment indicators.
4. **04 — Exploratory Data Analysis:** summarize and visualize delivery, sales, profit, customer, product and regional patterns.
5. **05 — Root Cause Analysis:** compare business segments to identify where performance issues are concentrated. These analyses identify associations and investigation priorities, not proof of causation.
6. **06 — Statistical Analysis:** use methods such as Chi-Square/Cramér's V, group-comparison tests and correlation analysis to add statistical context to observed patterns.
7. **Power BI:** communicate results in five dashboard areas: Executive Overview, Delivery Performance, Profitability Analysis, Customer & Product Analysis, and Regional & Operational Analysis.

### Machine learning phase

8. **07 — Late Delivery Data Audit & Leakage Control:** define the label, specify the prediction time, audit candidate features and create chronological train/validation/test assignments.
9. **08 — Late Delivery Model Training & Selection:** compare simple baselines with Logistic Regression, Random Forest and Histogram Gradient Boosting; use time-aware cross-validation and validation evidence to select a candidate.
10. **09 — Late Delivery Evaluation & Business Impact:** intended to evaluate the selected model on the untouched test period, analyze errors and assess an operational prioritization scenario. Do not report final test performance until this notebook has been run and checked.

## 6. Machine learning problem definition

The current ML task is a **binary classification** of the dataset's `Late_delivery_risk` field. The intended prediction time is **when an order is placed**. A useful prediction workflow must not rely on information that becomes known only after shipment or delivery.

Notebook 07 reports that `Late_delivery_risk` agrees with the indicator `Days for shipping (real) > Days for shipment (scheduled)` on 97.55% of rows. There are 4,423 rows marked as risk-positive even though actual shipping days are not greater than scheduled days, and no rows in the opposite direction in that comparison. This means the model target should currently be described precisely as the dataset's **`Late_delivery_risk` label**, not silently treated as a perfect measure of observed late arrival. The business definition should be confirmed before operational use.

The processed data contains multiple rows per order. Notebook 07 keeps an order within one chronological split, but the modelling table is still row-level. Before a real operational rollout, define whether the final risk score is needed per order item or one consolidated score per order.

### Leakage and feature-availability control

The audit excludes multiple post-outcome, identifier, historical/full-history and other potentially unsafe fields, and documents a feature manifest. However, a statistical scan alone cannot prove that all retained features were available at order placement. Profit-derived fields—including examples such as `Benefit per order`, `Order Item Profit Ratio`, `is_profit_outlier`, `loss_order_flag` and `profit_category`—must be checked against their definitions and removed if they require realized or future information. Until that review is completed, describe leakage control as an implemented audit with a remaining feature-availability verification step, rather than claiming that every feature is definitively safe.

## 7. What success looks like

The project is designed to deliver:

- Consistent, documented KPI definitions across Python, SQL and Power BI.
- Reproducible cleaning and analytical steps.
- Evidence-backed descriptions of delivery and profitability patterns.
- A fair comparison of a candidate model against simple baselines using chronological validation.
- A final evaluation on data that was not used for model selection.
- A clearly stated operational use case, such as prioritizing a limited number of orders for review, with its performance measured rather than assumed.

## 8. Scope and limitations

- The project uses a historical benchmark dataset, not a verified live company data feed.
- Reported patterns are evidence about this dataset and should not automatically be generalized to every supply chain.
- Statistical association does not prove causation.
- The reported KPI values require consistent denominators and metric definitions before being treated as final.
- The ML model is at the validation/selection stage until the feature-availability audit is complete and notebook 09's final test evaluation is verified.
- The source project guide notes that a direct shipping-cost field is not present. The project therefore cannot claim actual shipping-cost savings.
- The project has not established realized reduction in delivery delays, financial savings or production deployment.

## 9. Intended business value

FulfillIQ is a decision-support project. It helps an analyst investigate where delivery flags are concentrated, where sales and profitability differ, and which records or segments may deserve deeper review. The ML extension evaluates whether risk ranking could help operations prioritize attention. Any claimed savings or improved delivery outcomes would require a real intervention, cost/benefit assumptions and measured before-and-after results.
