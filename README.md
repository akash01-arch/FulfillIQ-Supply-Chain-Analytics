FulfillIQ — Supply Chain Analytics
Python · SQL · Statistics · Power BI · scikit-learn

FulfillIQ is an end-to-end supply chain analytics project using the DataCo Global Supply Chain dataset. It investigates delivery performance, profitability, customer and product performance, and regional operations through data preparation, SQL analysis, statistical investigation, and an interactive Power BI dashboard. The project also includes a machine-learning workflow to assess whether information available at order placement can help identify orders at higher risk of late delivery.
Project status: The descriptive, diagnostic, statistical and dashboard work is documented. The ML notebooks include feature/leakage auditing and model selection. Treat the reported ML metrics as validation results only until the feature-availability checks are resolved and the final held-out test evaluation is confirmed.

Business Problem
An e-commerce supply chain generates large amounts of order, product, customer, financial, geographic and delivery data. The business challenge is to convert that data into evidence that helps teams investigate:
- Delivery performance: Which shipping modes, markets and regions have higher late-delivery flag rates?
- Profitability: Which markets or products generate high revenue but relatively weak profit, and where are losses concentrated?
- Customer and product performance: Which customers, categories and products contribute most to sales and profit?
- Consistent reporting: Are KPIs such as late-delivery rate, average order value and profit margin defined at the correct data grain and calculated consistently?
- Predictive decision support: Can a model rank orders by late-delivery risk using only features that would be available when the order is placed?
See [BUSINESS_PROBLEM.md](BUSINESS_PROBLEM.md) for the detailed problem statement and analytical objectives.
Dataset
- Source: DataCo Global Supply Chain
- Size reported in the project guide: 180,519 records and 53 original features
- Data fields: Order dates, shipping mode, sales, profit, discounts, customer and product attributes, market/region, scheduled and actual shipping duration, and delivery-related flags
- Data grain: The project contains order-item-level rows; an Order Id is not necessarily unique per row. Always confirm the grain and denominator before describing a row-level metric as an order-level KPI.
The project guide and ML audit report 65,752 distinct Order Id values in the audited data. Confirm counts against the exact dataset version used when reproducing results.
Tools and Methods
- Python: Pandas and NumPy for data preparation, transformation and analysis
- Statistics: SciPy and statistical methods including Chi-Square, Cramér's V, group comparisons and correlation analysis
- SQL: CTEs, aggregations, CASE, subqueries and window functions for business analysis (the supplied SQL files use MySQL syntax)
- Power BI: Five-page dashboard for executive KPIs, delivery performance, profitability, customer/product analysis and regional/operational analysis
- Machine Learning: scikit-learn pipelines, baseline comparison, Logistic Regression, Random Forest, Histogram Gradient Boosting and time-aware validation
Project Workflow
Analytics and business intelligence
Notebook	Purpose
[01 — Data Understanding](Notebooks/01_Data_Understanding.ipynb)	Inspect dataset structure, columns, data types, dates and business meaning.
[02 — Data Cleaning](Notebooks/02_Data_Cleaning.ipynb)	Investigate missing values, inconsistent categories, data types, duplicates and unusual records.
[03 — Feature Engineering](Notebooks/03_Feature_Engineering.ipynb)	Create reusable analytical indicators for delivery, profitability, customers and products.
[04 — Exploratory Data Analysis](Notebooks/04_Exploratory_Data_Analysis(EDA\).ipynb)	Explore trends, distributions and segment-level patterns.
[05 — Root Cause Analysis](Notebooks/05_Root_Cause_Analysis.ipynb)	Compare business segments to identify areas that warrant deeper operational investigation.
[06 — Statistical Analysis](Notebooks/06_Statistical_Analysis.ipynb)	Use statistical tests and effect sizes to examine selected relationships.


Machine learning: late-delivery risk
Notebook	Purpose
[07 — Data Audit and Leakage Control](07_late_delivery_data_audit_leakage_control.ipynb)	Define the target and prediction-time boundary, audit feature availability and prepare data splits.
[08 — Model Training and Selection](08_late_delivery_model_training_selection.ipynb)	Compare simple baselines and candidate classifiers using validation results.
[09 — Evaluation and Business Impact](09_late_delivery_evaluation_business_impact.ipynb)	Document final held-out evaluation, errors, and the potential value of risk-based order prioritization. Verify this notebook's final outputs before quoting test metrics.


Related project assets are available in the [SQL Business Analysis](SQL%20Business%20Analysis/) folder, [Power BI](Power%20BI/) folder, [Datasets](Datasets/) folder and [Screenshots](Screenshots/) folder.
Findings and Model Status
- The project analysis reports that Shipping Mode had the strongest observed categorical association with late-delivery flags among the tested variables, with Cramér's V of approximately 0.433. This is an association, not proof that shipping mode causes delays.
- The original analytics report gives a late-delivery rate of approximately 57.28%. The ML audit reports 54.83% prevalence for the Late_delivery_risk target in its audited data. These figures use definitions or data-processing conditions that need to be reconciled before either is presented as the single definitive project-wide rate.
- The original report gives an aggregate profit margin of approximately 10.8% and average order value of approximately 559.45. Confirm the calculations, denominator and units against the exact data version before using these figures outside the project report.
- In the current model-selection notebook, tuned Logistic Regression achieved a validation ROC-AUC of 0.7320, compared with 0.7294 for tuned Random Forest and approximately 0.7264 for the planner-rule baseline. This is a modest validation improvement, not a final test result or evidence of operational impact.
- The target flag does not perfectly match the simple rule Days for shipping (real) > Days for shipment (scheduled). The audit reports 97.55% agreement and 4,423 disagreements. The target definition should be clearly explained before interpreting the model as a predictor of actual lateness.
See [BUSINESS_INSIGHTS.md](BUSINESS_INSIGHTS.md) for the detailed findings, caveats and proposed business actions.
Potential Business Use
If the ML workflow passes the feature-availability audit and final test evaluation, its predictions could be used to rank orders for review when operations capacity is limited. A suitable evaluation would compare the model's top-risk orders against a simple rule or random selection, then measure late-order capture, unnecessary alerts and performance across relevant segments.

This is a proposed decision-support use case. The project does not claim that it has already reduced late deliveries, saved money, or been deployed into a live operating process. The dataset does not contain a direct shipping-cost field, so shipping-cost savings cannot be calculated from the current data alone.
How to Explore the Repository
1. Start with BUSINESS_PROBLEM.md to understand the questions the project addresses.
2. Follow notebooks 01–06 to review the data preparation and analytics workflow.
3. Review the SQL scripts and Power BI dashboard for the reporting and decision-support work.
4. Follow ML notebooks 07–09 to understand the target audit, model selection and final evaluation process.
5. Use BUSINESS_INSIGHTS.md for a consolidated view of findings and limitations.
The notebooks use local file paths in places, so update dataset paths for your environment before running them. Use the data version and split definitions documented in the notebooks when reproducing metrics.
Limitations and Next Steps
- Reconcile row-level and order-level KPI definitions, especially the late-delivery rate.
- Confirm the prediction target and audit every feature for availability at order placement; profit-derived or post-delivery fields must not leak future information into the model.
- Complete and verify the final evaluation on the untouched test period before publishing final performance metrics.
- Add a reusable prediction script, automated input checks and tests before describing the model as deployable.
- Test an operational prioritization scenario with explicit capacity and cost assumptions before estimating business impact.
Project Documentation
- [Business Problem](BUSINESS_PROBLEM.md)
- [Business Insights](BUSINESS_INSIGHTS.md)
- [Project Report](project%20report.md)
Project: FulfillIQ — Supply Chain Analytics
Focus: Data Analyst / Business Intelligence analytics with a machine-learning extension
