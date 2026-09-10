# FulfillIQ

## Supply Chain Delivery & Profitability Intelligence

**An end-to-end data analytics project analyzing 180K+ supply chain orders to identify delivery bottlenecks, profitability drivers, customer behavior, and operational performance.**

**Tech Stack:** Python • SQL • Pandas • NumPy • Statistical Analysis • Scikit-learn • Power BI

---

## 📌 Project Overview

FulfillIQ is an end-to-end supply chain analytics project focused on understanding the business and operational factors affecting **delivery performance and profitability**.

The project analyzes a large supply chain dataset and follows a complete analytics workflow—from data understanding and cleaning to feature engineering, exploratory analysis, statistical validation, root-cause analysis, and interactive dashboard development.

The objective is not only to describe what happened, but to investigate **why it happened** and identify the factors that should be prioritized for business decision-making.

---

## 🎯 Business Problem

The analysis focuses on the following business questions:

* What is the overall delivery performance of the business?
* Which factors are most strongly associated with late deliveries?
* How do discounts influence profitability?
* Which products, customers, and regions contribute most to business performance?
* Where are the major operational and profitability risks?
* How can these findings be translated into actionable business insights?

---

## 📊 Dataset

The dataset contains approximately **180K+ order-level records** with **53 raw features**, covering the period **2015–2018**.

The data includes information related to:

* Orders and sales
* Profit and profitability
* Customers
* Products and categories
* Shipping and delivery
* Geographic regions
* Discounts and pricing
* Operational attributes

---

## 🔄 Analytics Workflow

```text
Raw Data
   │
   ▼
Data Understanding
   │
   ▼
Data Cleaning & Validation
   │
   ▼
Exploratory Data Analysis
   │
   ▼
Feature Engineering
   │
   ▼
Statistical Analysis
   │
   ▼
Root Cause Analysis
   │
   ▼
Feature Importance Analysis
   │
   ▼
Business Insights
   │
   ▼
Power BI Dashboard
```

---

## 🧹 Data Preparation

A structured data-cleaning and validation process was performed to prepare the dataset for analysis.

### Key Steps

* Inspected dataset structure and data types
* Identified and handled missing values
* Removed irrelevant and low-value columns
* Standardized categorical variables
* Converted date and numerical fields
* Checked duplicate and inconsistent records
* Applied business-rule validation
* Investigated extreme observations

### Outlier Handling

Extreme profit observations were identified using an **IQR-based approach**.

Instead of automatically removing all extreme values, they were retained and flagged for investigation because statistically unusual observations may still represent valid business transactions.

---

## ⚙️ Feature Engineering

Engineered **100+ analytical features** to support deeper business and operational analysis.

### Delivery Performance

* Shipping delay
* Late-delivery indicators
* Early-delivery indicators
* Delivery performance categories

### Profitability

* Profit margin
* Loss-making order flags
* Profitability categories

### Customer Analytics

* Customer order frequency
* Total customer sales
* Average order value
* Customer value segments
* Repeat customer indicators

### Product Analytics

* Product revenue
* Product order volume
* Average product profit
* Product sales ranking
* Product demand categories

### Risk Indicators

* Delivery risk scores
* High-risk order indicators
* High-discount indicators

---

## 📈 Exploratory Data Analysis

Exploratory analysis was performed to identify patterns across:

* Revenue and order trends
* Profit and profit margins
* Delivery performance
* Late versus on-time orders
* Shipping modes
* Product and category performance
* Customer purchasing behavior
* Regional performance
* Discount patterns
* Loss-making orders

---

## 🔍 Root Cause Analysis

The project goes beyond descriptive dashboarding by investigating potential drivers of delivery performance.

Categorical relationships with late delivery were evaluated using:

* **Chi-Square Tests**
* **Cramér's V**

Feature importance techniques were also applied using:

* **Decision Trees**
* **Random Forest**

### Key Finding

**Shipping Mode showed the strongest observed association with late delivery, with a Cramér's V of approximately 0.433.**

Compared with other categorical factors evaluated, Shipping Mode showed a substantially stronger relationship with delivery outcomes.

This finding was further supported through feature-importance analysis, highlighting shipping-related factors as key operational drivers worth prioritizing.

---

## 🧪 Statistical Analysis

Statistical methods were used to validate business findings rather than relying solely on visual patterns or descriptive statistics.

### Methods Applied

* Two-proportion tests
* Welch's t-test
* Chi-Square tests
* ANOVA
* Tukey HSD
* Pearson correlation
* Spearman correlation
* Confidence intervals
* Effect-size analysis
* Multiple-comparison considerations

### Business Questions Tested

* Does late-delivery performance differ across shipping modes?
* Do high-discount orders differ in profitability?
* Is there a difference between weekend and weekday delivery performance?
* Do profit margins vary across regions?
* What is the relationship between discount rate and profit margin?

The analysis considered **statistical significance, effect size, confidence intervals, and practical business significance** to avoid relying only on p-values.

---

## 📊 Key Insights

### 🚚 Delivery Performance

The analysis identified a **57.28% late-delivery rate**, highlighting delivery reliability as a major operational concern.

### 📦 Shipping Mode

Shipping Mode was identified as the strongest observed categorical driver of late delivery:

> **Cramér's V ≈ 0.433**

This indicates that shipping-related operational decisions should be prioritized when investigating delivery delays.

### 💰 Profitability

Overall profitability was analyzed separately from revenue to identify situations where higher sales did not necessarily result in stronger profit margins.

### 🏷️ Discount Analysis

The relationship between discounting and profitability was investigated using statistical tests and correlation analysis to distinguish statistically significant results from practically meaningful business effects.

### 👥 Customer & Product Analysis

Customer and product features were engineered to analyze:

* High-value customers
* Repeat purchasing behavior
* Customer purchasing frequency
* Product revenue contribution
* Product profitability
* Demand patterns

---

## 📉 Power BI Dashboard

A **5-page interactive Power BI dashboard** was developed to communicate the analytical findings.

### Dashboard Coverage

**1. Executive Overview**
High-level KPIs covering orders, revenue, profit, profitability, and delivery performance.

**2. Delivery Performance**
Late-delivery analysis, shipping mode performance, delivery trends, and operational risk.

**3. Profitability Analysis**
Revenue, profit, profit margin, discount analysis, and loss-making orders.

**4. Customer & Product Analysis**
Customer value, repeat behavior, product performance, and category-level insights.

**5. Regional & Operational Analysis**
Regional performance, shipping patterns, operational trends, and risk indicators.


## 🛠️ Technology Stack

| Category                  | Technologies                               |
| ------------------------- | ------------------------------------------ |
| **Programming**           | Python, SQL                                |
| **Data Analysis**         | Pandas, NumPy                              |
| **Visualization**         | Matplotlib, Seaborn, Plotly                |
| **Statistics**            | SciPy, Statsmodels                         |
| **Machine Learning**      | Scikit-learn, Decision Tree, Random Forest |
| **Business Intelligence** | Power BI, DAX, Power Query                 |
| **Development Tools**     | Jupyter Notebook, Git, GitHub, VS Code     |

---

## 📁 Project Structure

```text
FulfillIQ/
│
├── data/
│   └── raw_data/
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_eda.ipynb
│   ├── 05_root_cause_analysis.ipynb
│   └── 06_statistical_analysis.ipynb
│
├── dashboard/
│   └── FulfillIQ.pbix
│
├── screenshots/
│   ├── dashboard_1.png
│   ├── dashboard_2.png
│   ├── dashboard_3.png
│   ├── dashboard_4.png
│   └── dashboard_5.png
│
├── README.md
└── requirements.txt
```

---

## 💡 Business Recommendations

Based on the analysis, the following areas should be prioritized:

1. **Review shipping operations** to address the high late-delivery rate.
2. **Investigate shipping modes with weaker delivery performance** and identify operational bottlenecks.
3. **Evaluate discount strategies alongside profit margin**, rather than focusing only on sales volume.
4. **Monitor loss-making orders and low-margin segments** to identify profitability risks.
5. **Use customer segmentation** to identify high-value and repeat customers.
6. **Track product and regional performance** to support operational and commercial decisions.
7. **Monitor delivery-risk indicators** to identify potentially problematic orders earlier.

---

## 🚀 Skills Demonstrated

This project demonstrates hands-on experience with:

* Data Cleaning and Validation
* Exploratory Data Analysis
* SQL and Business Analysis
* Feature Engineering
* Statistical Hypothesis Testing
* Effect-Size Interpretation
* Root Cause Analysis
* Decision Tree and Random Forest Feature Importance
* Business KPI Development
* Power BI Dashboard Development
* Data Visualization
* Translating Analysis into Business Insights

---

## 👤 Author

**Akash More**
Final-Year BCA (Data Science) Student | Aspiring Data Analyst

**Skills:** SQL • Python • Power BI • Excel • Statistics • Data Analytics


