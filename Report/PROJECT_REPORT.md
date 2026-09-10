# FulfillIQ — Supply Chain Delivery & Profitability Intelligence

## Executive Analytics Report

**Project Type:** End-to-End Data Analytics / Business Intelligence
**Domain:** E-Commerce & Supply Chain
**Dataset:** DataCo Global Supply Chain
**Records:** 180,519
**Original Features:** 53
**Tools:** Python, SQL, PostgreSQL/MySQL, Pandas, NumPy, SciPy, Scikit-learn, Power BI
**Analysis Areas:** Delivery, Profitability, Customers, Products, Markets, Shipping, Risk

---

## 1. Executive Summary

FulfillIQ is an end-to-end supply chain and business analytics project designed to transform raw e-commerce order data into actionable business insights.

The project analyzes **180,519 order-level records across 53 original features** covering sales, profitability, customers, products, markets, shipping modes, delivery performance, discounts, and operational characteristics.

The primary objective was to understand:

* Where revenue is being generated
* Where profitability is being created or lost
* Which products and customers generate the most business value
* Where delivery performance is creating operational risk
* Which shipping modes and regions require investigation
* Whether discounting is associated with weaker profitability
* Which business segments should receive management attention

The project combines:

**Data Cleaning → Feature Engineering → EDA → SQL Analytics → Statistical Analysis → Root Cause Analysis → Risk Scoring → Power BI Dashboard**

The final output is a business-focused analytics solution that connects **commercial performance with supply-chain operations**.

---

# 2. Business Problem

A large e-commerce organization can generate substantial amounts of operational data but still lack clear answers to important management questions.

The core business problem addressed in this project was:

> **How can management identify where profitable growth is being created, where profitability is being lost, where delivery performance is creating operational risk, and which markets, products, customers, and orders should receive priority attention?**

The project focuses on four major business challenges:

### 2.1 Revenue vs Profitability

High revenue does not necessarily mean high profitability.

Some markets and products may generate significant sales while producing weak margins because of:

* Heavy discounting
* Product mix
* Pricing decisions
* Operational inefficiencies

Therefore, the analysis evaluates revenue and profitability together rather than optimizing revenue alone.

### 2.2 Delivery Reliability

Late deliveries represent an important operational risk.

The analysis investigates:

* Shipping modes
* Regions
* Markets
* Market × shipping-mode combinations
* Actual vs scheduled shipping time
* High-value orders exposed to delivery risk

The objective is not simply to count late orders but to identify **where operational intervention should happen first**.

### 2.3 Unequal Customer and Product Value

Business value is not evenly distributed.

The project identifies:

* High-value customers
* High-profit products
* High-revenue products
* Loss-making products
* Customer segments
* Revenue concentration
* Purchase frequency
* Average basket value

This helps determine where the company should protect, promote, optimize, or review business activity.

### 2.4 Management Prioritization

A large dataset can generate hundreds of metrics, but executives need to know:

> **What should we act on first?**

Therefore, the project includes:

* Market profitability ranking
* Product portfolio classification
* Delivery-risk scoring
* High-value risky-order identification
* Executive supply-chain health scoring

These frameworks are designed to convert analysis into management priorities.

---

# 3. Project Objectives

The main objectives were to:

1. Understand the structure and quality of the supply-chain dataset.
2. Clean and validate raw business data.
3. Engineer analytical features for business analysis.
4. Analyze revenue, profit, and profitability trends.
5. Evaluate customer and product performance.
6. Investigate delivery performance and operational risk.
7. Identify high-revenue but low-profit segments.
8. Analyze discounting and profitability.
9. Use statistical methods to evaluate important relationships.
10. Develop risk and prioritization frameworks.
11. Build an interactive Power BI dashboard.
12. Translate analytical findings into actionable business recommendations.

---

# 4. Dataset Overview

The dataset contains:

| Attribute              | Description                                                   |
| ---------------------- | ------------------------------------------------------------- |
| Records                | 180,519                                                       |
| Original Columns       | 53                                                            |
| Domain                 | E-Commerce / Supply Chain                                     |
| Data Level             | Order / Transaction                                           |
| Business Areas         | Sales, Customers, Products, Shipping, Delivery, Profitability |
| Time Dimension         | Order dates / shipping dates                                  |
| Geographic Dimensions  | Markets, regions, countries                                   |
| Operational Dimensions | Shipping mode, scheduled shipping days, actual shipping days  |

The original dataset contains information related to orders, customers, products, sales, profitability, discounts, geography, shipping, and delivery risk.

---

# 5. Analytical Workflow

```text
Raw Dataset
     ↓
Data Understanding
     ↓
Data Quality Assessment
     ↓
Data Cleaning & Validation
     ↓
Exploratory Data Analysis
     ↓
Feature Engineering
     ↓
SQL Business Analytics
     ↓
Statistical Analysis
     ↓
Root Cause Analysis
     ↓
Risk & Priority Frameworks
     ↓
Power BI Dashboard
     ↓
Business Recommendations
```

---

# 6. Data Preparation

The data preparation stage included:

* Missing-value analysis
* Data-type validation
* Date conversion
* Categorical standardization
* Identifier validation
* Business-rule validation
* Sales consistency checks
* Shipping-day validation
* Delivery-risk validation
* Duplicate/inconsistency checks
* Outlier investigation

The dataset was prepared specifically for downstream business and statistical analysis.

---

# 7. Outlier Analysis

Extreme values were investigated rather than automatically removed.

Approximately **18,942 extreme profit observations** were identified using an IQR-based approach.

The project intentionally used an **outlier-flagging approach** instead of blindly deleting extreme observations.

This is important because an extreme profit value may represent:

* A legitimate high-value transaction
* A special business event
* An unusual product/order
* A data-quality issue

Therefore, extreme observations were treated as analytical signals requiring investigation.

---

# 8. Feature Engineering

More than **100 analytical features** were engineered across multiple business dimensions.

### Delivery Features

* Shipping delay
* Late-delivery flag
* Early-delivery flag
* Delivery performance category
* Shipping efficiency
* Delivery risk score
* High-risk order flag

### Profitability Features

* Order revenue
* Average Order Value
* Profit margin
* Loss-order flag
* Profit category
* Discount bands

### Customer Features

* Customer order count
* Customer total sales
* Customer average order value
* Customer value segment
* Repeat-customer indicator
* Purchase frequency
* Average basket size

### Product Features

* Product revenue
* Product order count
* Product average profit
* Product sales rank
* Product demand category
* Product portfolio classification

### Operational Features

* Shipping mode
* Market
* Region
* Scheduled shipping days
* Actual shipping days
* Market × shipping-mode risk

The engineered feature set was designed to support both descriptive analytics and future predictive modeling.

---

# 9. Exploratory Data Analysis

EDA was structured around business questions rather than simply generating charts.

### Revenue Analysis

Analyzed:

* Total revenue
* Revenue trends
* Year-over-year growth
* Monthly revenue
* Market contribution
* Product revenue
* Revenue concentration

### Profitability Analysis

Analyzed:

* Total profit
* Profit margin
* Market profitability
* Product profitability
* Loss-making products
* High-revenue/low-profit segments
* Discount vs profitability

### Customer Analysis

Analyzed:

* Customer value
* Customer segments
* Top customers
* Order frequency
* Average basket value
* Customer profitability

### Operational Analysis

Analyzed:

* Late-delivery rate
* Shipping-mode performance
* Regional delivery performance
* Actual vs scheduled shipping time
* Delivery risk
* High-value risky orders

These analytical areas directly map business questions to measurable KPIs.

---

# 10. SQL Analytics

SQL was used to perform advanced commercial and operational analysis.

Major analyses included:

* Delivery-risk analysis
* High-revenue/low-profit markets
* Market profitability ranking
* Top profitable products by category
* Market revenue contribution
* Shipping-mode delivery risk
* Loss-making products
* Top customers by profit
* Category performance
* Year-over-year revenue growth
* Monthly revenue trends
* Three-month moving average
* Discount-band profitability
* High-value orders with delivery risk
* Customer-segment profitability
* Market × shipping-mode risk
* Product Pareto analysis
* Product portfolio classification
* Supply-chain risk scoring
* Executive supply-chain health scoring

For example, the SQL layer evaluates markets with **above-average revenue but below-average profit margin**, allowing management to investigate pricing, discounts, product mix, and operational economics.

---

# 11. Key Business KPIs

The project tracks several executive-level KPIs.

| KPI                                 |     Result |
| ----------------------------------- | ---------: |
| Orders / Records                    |    180,519 |
| Late Delivery Rate                  |    ~57.28% |
| Average Profit Margin               |     ~10.8% |
| Average Order Value                 |    ~559.45 |
| Average Delivery Time               | ~3.50 days |
| Extreme Profit Observations Flagged |    ~18,942 |
| Engineered Features                 |       100+ |

These KPIs provide a high-level view of financial and operational performance.

---

# 12. Delivery Risk Analysis

One of the most important findings was the high proportion of orders associated with late-delivery risk.

The analysis therefore investigated delivery performance across:

* Shipping modes
* Markets
* Regions
* Categories
* Operational combinations

A particularly important analytical finding was that **Shipping Mode showed the strongest observed categorical association with late delivery** among the variables tested.

### Cramér's V

**Shipping Mode → Late Delivery**

**Cramér's V ≈ 0.433**

Other tested dimensions showed substantially weaker associations:

| Variable      | Cramér's V |
| ------------- | ---------: |
| Shipping Mode |     ~0.433 |
| Order Region  |     ~0.020 |
| Category      |     ~0.016 |
| Holiday       |     ~0.003 |
| Weekend       |     ~0.001 |

### Interpretation

Shipping Mode had the strongest observed association with late-delivery outcomes in the analysis.

This should be interpreted as **association, not causation**.

The finding suggests that shipping operations deserve deeper investigation, including:

* Carrier performance
* Routing
* Capacity
* Scheduling
* Market-specific constraints

---

# 13. Profitability Analysis

Revenue and profitability were analyzed separately because high sales volume does not automatically translate into strong financial performance.

The analysis classified business areas into four strategic groups:

| Revenue | Profitability | Recommended Action |
| ------- | ------------- | ------------------ |
| High    | High          | Protect & Grow     |
| High    | Low           | Optimize           |
| Low     | High          | Promote            |
| Low     | Low           | Review             |

### High Revenue + High Profit

Recommended actions:

* Protect availability
* Prioritize supply
* Maintain pricing discipline
* Support profitable growth

### High Revenue + Low Profit

Recommended actions:

* Review pricing
* Investigate discounting
* Analyze operating costs
* Review product economics

### Low Revenue + High Profit

Recommended actions:

* Test targeted promotions
* Increase visibility
* Investigate demand barriers

### Low Revenue + Low Profit

Recommended actions:

* Review product assortment
* Reduce unnecessary investment
* Consider rationalization

This framework turns financial analysis into an actionable decision system.

---

# 14. Discount vs Profitability Analysis

The project investigated whether higher discounting is associated with weaker profitability.

Orders were grouped into discount bands:

* No discount
* Low discount
* Medium discount
* High discount

For each band, the analysis evaluated:

* Order volume
* Revenue
* Profit
* Profit margin

The SQL analysis explicitly compares discount bands against profitability to identify potential value erosion.

Statistical analysis was also used to evaluate differences between discount groups.

---

# 15. Statistical Analysis

Statistical methods were used to move beyond simple descriptive reporting.

### Methods Used

* Chi-Square Test
* Cramér's V
* Two-Proportion Z-Test
* Welch's t-Test
* Mann-Whitney U Test
* One-Way ANOVA
* Tukey HSD
* Pearson Correlation
* Spearman Correlation
* Confidence Intervals
* Effect Size Analysis

### Example Hypotheses

#### H1 — Shipping Mode and Delivery

Evaluate whether delivery outcomes differ significantly across shipping modes.

#### H2 — Discounting and Profitability

Evaluate whether high-discount orders have weaker profit margins than normal-discount orders.

#### H3 — Weekend vs Weekday Delivery

Compare late-delivery rates between weekend and weekday orders.

#### H4 — Regional Profitability

Determine whether profit margins differ significantly across regions.

#### H5 — Discount Rate vs Profit Margin

Evaluate the relationship between discount rate and profit margin.

---

# 16. Statistical Thinking

The project did not rely solely on p-values.

The analysis considered:

**Statistical Significance + Effect Size + Confidence Intervals + Business Significance**

This distinction is important because a statistically significant relationship may not necessarily have a meaningful business impact.

For example:

> A very large dataset can produce a small p-value even when the practical effect is weak.

Therefore, effect sizes and confidence intervals were considered alongside hypothesis-test results.

---

# 17. Customer Analytics

Customer analysis focused on identifying where customer value is concentrated.

Key metrics included:

* Total customer revenue
* Total customer profit
* Number of orders
* Average order value
* Purchase frequency
* Repeat-customer status
* Customer value segment

The analysis supports decisions such as:

* Which customers deserve retention focus?
* Which customer segments generate the most value?
* Where should targeted offers be used?
* How concentrated is revenue among high-value customers?

---

# 18. Product Analytics

Products were evaluated using both revenue and profitability.

Important analyses included:

* Top revenue products
* Top profit products
* Loss-making products
* High-revenue/low-profit products
* Product rankings
* Product demand categories
* Profit Pareto analysis

The project also uses product portfolio classification to support strategic decisions.

---

# 19. Revenue Concentration

The project evaluates the percentage of total revenue contributed by individual markets and products.

This helps identify strategic dependency.

If a relatively small number of products or markets contribute a large proportion of revenue, disruptions affecting those areas could have a disproportionate business impact.

---

# 20. High-Value Delivery Risk

A key business principle used in the project was:

> **Risk should be evaluated together with business value.**

A delayed low-value order and a delayed high-value order may represent very different business priorities.

Therefore, the project identifies:

* High-value orders
* Delivery-risk status
* Shipping mode
* Market
* Product category
* Actual shipping time
* Scheduled shipping time

This allows management to prioritize operational attention toward high-value risky orders.

---

# 21. Executive Supply-Chain Health Score

The project combines:

* Revenue
* Profitability
* Delivery reliability
* Order volume

to create an executive-level market scorecard.

Markets can then be classified into categories such as:

* Critical
* Needs Attention
* Stable
* Strong

This is an analytical prioritization framework rather than a universally valid business score. In a production environment, scoring weights should be validated with business stakeholders.

---

# 22. Power BI Dashboard

A five-page interactive Power BI dashboard was developed to communicate the analysis.

### Page 1 — Executive Overview

Focus:

* Revenue
* Profit
* Profit margin
* Orders
* AOV
* Delivery performance
* Overall business health

### Page 2 — Delivery Performance

Focus:

* Late-delivery rate
* Shipping-mode performance
* Regional delivery performance
* Actual vs scheduled shipping time
* Delivery-risk segments

### Page 3 — Profitability Analysis

Focus:

* Revenue
* Profit
* Profit margin
* Discounting
* Loss-making segments
* High-revenue/low-profit areas

### Page 4 — Customer & Product Analysis

Focus:

* Top customers
* Customer segments
* Product revenue
* Product profitability
* Product rankings
* Customer behavior

### Page 5 — Regional & Operational Analysis

Focus:

* Market performance
* Regional performance
* Shipping modes
* Delivery risk
* Operational priorities

---

# 23. Business Recommendations

## Recommendation 1 — Investigate Shipping Operations

Shipping Mode demonstrated the strongest observed association with late delivery.

Management should investigate:

* Carrier performance
* Route efficiency
* Capacity constraints
* Scheduling
* Market-specific operational issues

---

## Recommendation 2 — Monitor High-Value Risky Orders

Orders with high business value and delivery risk should receive priority monitoring.

This can support:

* Proactive intervention
* Customer communication
* Exception management
* Operational escalation

---

## Recommendation 3 — Protect Profitable Products

High-revenue/high-profit products should receive priority in:

* Inventory planning
* Availability
* Supply allocation
* Commercial strategy

---

## Recommendation 4 — Review High-Revenue/Low-Profit Segments

Revenue alone should not be used as the primary success metric.

Management should investigate:

* Discount levels
* Pricing
* Product mix
* Operational economics

---

## Recommendation 5 — Improve Discount Discipline

Discounting should be evaluated against:

* Revenue growth
* Profit
* Profit margin
* Customer behavior

The goal is not simply to maximize sales volume but to ensure promotions create sustainable value.

---

## Recommendation 6 — Focus on High-Value Customers

Customer segmentation can support:

* Retention strategies
* Personalized offers
* Loyalty initiatives
* Profit-focused customer management

---

# 24. What I Learned

This project strengthened my ability to:

* Work with large real-world datasets
* Perform structured data cleaning
* Engineer business-focused features
* Write advanced SQL
* Perform exploratory data analysis
* Analyze business KPIs
* Apply statistical hypothesis testing
* Interpret effect sizes
* Perform root-cause analysis
* Build risk frameworks
* Develop Power BI dashboards
* Translate analytical results into business recommendations

Most importantly, the project taught me to approach analytics from the perspective of:

> **Business Question → Data → Analysis → Evidence → Decision**

rather than simply creating charts and reports.

---

# 25. Project Limitations

The current project focuses primarily on descriptive, diagnostic, and statistical analytics.

The engineered dataset provides an ML-ready foundation, but the current project does **not yet demonstrate a completed predictive model with formal train/test evaluation**. Therefore, predictive accuracy should not be claimed.

Potential future modeling tasks include:

### Late Delivery Prediction

**Target:** `is_late`

Potential features:

* Shipping mode
* Market
* Region
* Scheduled shipping days
* Product/category
* Order value
* Discount
* Customer segment
* Historical operational features

### Profitability Prediction

Potential targets:

* Profit margin
* Loss-order indicator
* Profitability category

These models could support proactive operational and commercial decision-making.

---

# 26. Future Improvements

Future versions of FulfillIQ could include:

* Late-delivery prediction model
* Profitability prediction model
* Model evaluation using Precision, Recall, F1, ROC-AUC
* Model explainability
* Automated data pipelines
* Scheduled dashboard refresh
* Real-time delivery-risk monitoring
* API integration
* Automated alerts for high-risk orders
* Advanced customer segmentation
* Demand forecasting
* Deployment to cloud infrastructure

---

# 27. Important Analytical Limitation

The dataset does not contain a direct shipping-cost field.

Therefore, this project does **not** claim to calculate actual shipping costs.

Instead, shipping operations are evaluated using:

* Shipping time
* Delivery delay
* Scheduled shipping time
* Delivery risk
* Shipping efficiency
* Profitability

This distinction is important for maintaining analytical accuracy.

---

# 28. Project Structure

```text
FulfillIQ/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_eda.ipynb
│   └── 05_statistical_analysis.ipynb
│
├── sql/
│   ├── 01_delivery_risk.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_profitability_analysis.sql
│   └── 04_advanced_business_analysis.sql
│
├── dashboard/
│   └── FulfillIQ.pbix
│
├── screenshots/
│   ├── dashboard_01.png
│   ├── dashboard_02.png
│   ├── dashboard_03.png
│   ├── dashboard_04.png
│   └── dashboard_05.png
│
├── requirements.txt
├── README.md
└── LICENSE
```

---

# 29. Technology Stack

### Programming & Analytics

* Python
* Pandas
* NumPy
* SciPy
* Matplotlib
* Seaborn
* Scikit-learn

### SQL

* Advanced SQL
* CTEs
* Subqueries
* Window Functions
* Aggregations
* CASE statements
* Ranking
* Time-series analysis

### Business Intelligence

* Power BI
* DAX
* Power Query
* Data Modeling
* KPI Development
* Interactive Dashboarding

### Statistical Analysis

* Hypothesis Testing
* Confidence Intervals
* Effect Size
* Chi-Square
* Cramér's V
* Welch's t-Test
* Mann-Whitney U
* ANOVA
* Correlation Analysis

---

# 30. Final Business Impact

FulfillIQ transforms a large order-level dataset into a structured business intelligence solution.

The project helps management answer four fundamental questions:

### Where are we making money?

Through revenue and profitability analysis.

### Where are we losing value?

Through low-margin, loss-making, and discount-related analysis.

### Where is operational risk occurring?

Through delivery-risk and shipping-mode analysis.

### What should management prioritize?

Through customer, product, market, risk, and executive health frameworks.

The core value of the project is therefore not just reporting historical performance.

It is about turning data into **business priorities and actionable decisions**.

---

# 31. Final Conclusion

FulfillIQ demonstrates an end-to-end Data Analyst workflow using real-world supply-chain data.

The project combines:

**Python + SQL + Statistics + Power BI + Business Thinking**

to investigate profitability, customer value, product performance, delivery reliability, and operational risk.

The analysis demonstrates that effective analytics requires more than technical skills. It requires the ability to:

1. Understand the business problem.
2. Validate the data.
3. Select appropriate analytical methods.
4. Interpret statistical evidence correctly.
5. Separate correlation from causation.
6. Translate findings into business actions.
7. Communicate results through effective visualization.

The project ultimately provides a framework for moving from:

> **Raw Data → Business Insight → Management Priority → Future Predictive Analytics**
