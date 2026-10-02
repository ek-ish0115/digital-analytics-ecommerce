# Digital Analytics for E-Commerce Startup

## 📌 Project Overview

An end-to-end data analytics project focused on analyzing the performance of a newly launched e-commerce retail startup selling stuffed animal toys.

The project combines **SQL Server, Power BI, Python, and GitHub** to transform raw e-commerce data into meaningful business insights, interactive dashboards, and predictive analysis.

The analysis covers sales performance, website traffic, customer behaviour, marketing performance, product performance, orders, returns, and refunds.

---

## 🎯 Business Problem

The e-commerce startup is preparing for its next funding round and needs a centralized, data-driven view of business performance.

The key business questions include:

- How is revenue performing over time?
- How are orders and sales performing?
- How effectively is the website converting visitors into customers?
- How does website performance vary across devices?
- How do new and repeat sessions behave?
- Which marketing sources and campaigns perform better?
- Which products contribute most to sales?
- What is the impact of product returns and refunds?
- What opportunities can support future business growth?
- Can customer conversion and order value be predicted?

---

## 🎯 Project Objectives

- Analyze overall sales and revenue performance
- Monitor website traffic and session performance
- Analyze customer and purchasing behaviour
- Evaluate marketing source and campaign performance
- Analyze product performance
- Monitor returns and refunds
- Identify opportunities for future business growth
- Build interactive business dashboards
- Perform exploratory data analysis using Python
- Develop predictive models for customer conversion and order value
- Generate actionable business insights

---

## 👥 Stakeholders

| Stakeholder | Role | Business Focus |
|---|---|---|
| Cindy Sharp | CEO | Strategic Decisions & Business Growth |
| Tom Parmesan | Marketing Director | Marketing Strategy & Campaign Management |
| Morgan Rockwell | Website Manager | Website Optimisation & Performance |

---

## 🛠️ Technology Stack

| Tool | Purpose |
|---|---|
| SQL Server | Data storage, data quality checks and SQL analysis |
| Power BI | Interactive dashboards and KPI reporting |
| Python | Exploratory Data Analysis and Predictive Modelling |
| GitHub | Project version control and documentation |

---

## 📊 Dataset

The project uses six main datasets covering the period from **19-Mar-2012 to 19-Mar-2015**.

### 1. ORDERS

Contains order-level information including:

- Order ID
- Order creation date
- Website session ID
- User ID
- Primary product ID
- Items purchased
- Revenue
- Cost

### 2. ORDER ITEMS

Contains product-level information for items included in orders:

- Order Item ID
- Order ID
- Product ID
- Primary item indicator
- Selling price
- Cost

### 3. PRODUCTS

Contains product master information including:

- Product ID
- Product name
- Product creation date

### 4. WEBSITE SESSIONS

Contains website session and marketing information including:

- Website Session ID
- User ID
- New or repeat session
- UTM source
- UTM campaign
- UTM content
- Device type
- Referrer URL

### 5. WEBSITE PAGEVIEWS

Contains website browsing information including:

- Pageview ID
- Website Session ID
- Pageview URL
- Pageview creation date

### 6. ORDER ITEM REFUNDS

Contains return and refund information including:

- Refund ID
- Order Item ID
- Order ID
- Refund date
- Refunded amount

---

## 🔄 Project Workflow

```text
Raw E-Commerce Data

        ↓

SQL Server

        ↓

Data Quality Checks & Data Preparation

        ↓

SQL Analysis & KPI Development

        ↓

Power BI

        ↓

Interactive Dashboards

        ↓

Python

        ↓

EDA & Predictive Modelling

        ↓

Business Insights & Recommendations

        ↓

GitHub
```

---

# 📈 Power BI Dashboards

The Power BI reporting layer provides interactive dashboards for monitoring overall business performance, website activity, marketing performance, customer behaviour, products, and returns.

## 1. Executive Overview

Provides a high-level view of overall e-commerce business performance.

### Key KPIs

- Total Revenue
- Total Orders
- Total Units Sold
- Average Order Value
- Gross Profit
- Gross Profit Margin
- Total Sessions
- Session Conversion Rate

### Visualizations

- Monthly Revenue Trend
- Monthly Orders Trend
- Revenue Performance
- Order Performance
- AOV & Gross Margin
- Website Performance
- Business Growth Trends

---

## 2. Website & Marketing Performance

Focuses on website traffic, customer sessions, conversion and marketing performance.

### Key KPIs

- Total Sessions
- Total Pageviews
- Conversion Rate
- New Sessions
- Repeat Sessions
- Total Users

### Analysis

- Sessions over time
- Pageviews over time
- New vs Repeat Sessions
- Device-wise Conversion
- Sessions by UTM Source
- Orders by Marketing Source
- Conversion by Campaign

---

## 3. Product, Customer & Returns Analysis

Focuses on product performance, customer behaviour and refund activity.

### Analysis

- Product Revenue
- Units Sold
- Product Performance
- New vs Repeat Customer Behaviour
- Returned Items
- Return Rate
- Refunded Amount
- Product-wise Returns
- Highest Returned Products

---

# 🤖 Predictive Analysis
Two predictive models were developed using Python and Scikit-learn.

## 1. Customer Conversion Prediction

A **Logistic Regression** model was developed to predict customer conversion behaviour using website and session-related information.

## Model Performance

| Metric | Result |
|---|---:|
| Accuracy | 37.03% |
| Precision | 37.03% |
| Recall | 85.46% |
| F1 Score | 15.86% |
| ROC-AUC | 61.08% |

The model was evaluated using a train-test split.

## 2. Order Value Prediction

A **Linear Regression** model was developed to predict order value.

## Model Performance

| Metric | Result |
|---|---:|
| R² | 91.05% |
| MAE | $2.59 |
| MSE | 28.08 |
| RMSE | $5.30 |

The model was evaluated using a train-test split.
.

---

# 📊 Python Exploratory Data Analysis

Python was used for:

- Data cleaning
- Data type validation
- Missing-value analysis
- Duplicate checks
- Exploratory Data Analysis
- Website session analysis
- Conversion analysis
- Marketing analysis
- Customer behaviour analysis
- Product analysis
- Returns and refund analysis
- Feature preparation
- Predictive modelling

## Key Visualizations

- Monthly Revenue Trend
- Monthly Orders Trend
- Website Sessions Trend
- Device-wise Conversion
- Marketing Source Performance
- Product Performance
- New vs Repeat Sessions
- Returns and Refund Analysis

---

# 💡 Key Business Insights

The analysis provides visibility into:

- Revenue and order trends
- Website traffic and conversion performance
- Desktop vs Mobile conversion
- New and repeat customer behaviour
- Marketing source and campaign performance
- Product contribution
- Returns and refunds
- Customer conversion behaviour
- Order value patterns

---

# 🔑 Key Results

- 💰**Total Revenue:** $1.94M
- 📈**Gross Profit:** $1.22M
- 📊**Gross Profit Margin:** 62.74%
- 🛒**Total Orders:** 32K
- 📦**Total Units Sold:** 40K
- 💵**Average Order Value:** $59.90
- 🌐**Total Sessions:** 473K
- 👁️**Total Pageviews:** 1.19M
- 🎯**Session Conversion Rate:** 6.8%
- 🔄**Total Returned Items:** 2K
- 📉**Return Rate:** 4.32%
- 💸**Total Refunded Amount:** $112.4K
- 🧸**Highest Returned Product:** The Original Mr Fuzzy

---

# 🚀 Business Recommendations

Based on the analysis, the following areas can support future business growth:

- Improve the mobile shopping experience.
- Expand the product portfolio.
- Encourage repeat purchases and customer retention.
- Focus marketing efforts on high-performing sources and campaigns.
- Explore influencer partnerships.
- Use bundles and multi-product offers to increase average order value.
- Monitor product returns and refund patterns.
- Continue tracking website conversion and customer behaviour.

---


# 📂 Project Structure

```text
digital-analytics-ecommerce/
│
├── SQL_Codes/
│   ├── Data_Quality_Checks.sql
│   ├── Data_Cleaning.sql
│   └── EDA_KPIs.sql
│
├── Python_Codes_App/
│   ├── EDA.py
│   ├── Predictive_Analysis.py
│   └── app.py
│
├── PowerBI_Dashboards_Links/
│   └── Dashboard_Links.txt
│
├── ER_Diagram/
│   └── ER_Diagram.png
│
├── Data_Dictionary/
│   └── Data_Dictionary.xlsx
│
└── README.md
```
---

# 🔍 Analytical Approach

## Descriptive Analysis

Used to understand:

- Revenue
- Orders
- Units Sold
- Average Order Value
- Website Sessions
- Pageviews
- Product Performance
- Returns and Refunds

## Diagnostic Analysis

Used to investigate:

- Revenue trends
- Website conversion differences
- Device performance
- Marketing source performance
- New vs Repeat behaviour
- Product performance
- Return patterns

## Predictive Analysis

The project uses:

- **Logistic Regression** for customer conversion prediction
- **Linear Regression** for order value prediction

---

# 📌 Key Business Metrics

## Average Order Value

```text
AOV = Total Revenue / Total Orders
```

## Gross Profit

```text
Gross Profit = Revenue - Cost
```

## Gross Profit Margin

```text
Gross Profit Margin = Gross Profit / Revenue × 100
```

## Conversion Rate

```text
Conversion Rate = Orders / Website Sessions × 100
```

## Return Rate

```text
Return Rate = Returned Items / Total Items Sold × 100
```

---

# ⭐ Project Highlights

- End-to-end e-commerce analytics project
- SQL Server-based data analysis
- Data quality and validation checks
- Interactive Power BI dashboards
- Python-based exploratory analysis
- Website and marketing performance analysis
- Customer behaviour analysis
- Product and refund analysis
- Logistic Regression
- Linear Regression
- Predictive analytics
- Business-focused KPI analysis
- GitHub project documentation

---

# 👩‍💻 Author

## Ekta Grewal

**Data Analyst | SQL | Python | Power BI | Snowflake | Databricks**

📍 Gurgaon, Haryana, India

---

# 📫 Contact

**Email:** grewalektaig98@gmail.com

**LinkedIn:** [Ekta Grewal](https://www.linkedin.com/in/ekta-grewal-121500224/)

---

# ⭐ Thank You

Thank you for visiting this project.

This project demonstrates an end-to-end approach to transforming e-commerce data into meaningful business insights using SQL Server, Power BI and Python.
