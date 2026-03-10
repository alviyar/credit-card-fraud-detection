# Credit Card Fraud Detection

**Link**: https://alviyar.github.io/credit-card-fraud-detection/  

<img width="1265" height="747" alt="image" src="https://github.com/user-attachments/assets/21646c52-c290-4be9-8f81-b2f3212c51a3" />

📌 Overview

An interactive Power BI dashboard analyzing fraud patterns across 10,000 credit card transactions.

The dashboard identifies high-risk segments based on transaction behavior, device trust, and merchant category to support data-driven fraud prevention.

🎯 **Objectives**

Calculate overall fraud rateIdentify high-risk transaction segments

Analyze fraud distribution by category and behavior

Measure financial impact of fraud

📊 **Key Metrics**

Total Transactions: 10,000

Total Fraud Cases: 151

Total Fraud Amount: ₹32.64K

Fraud Rate: 1.51%

🤖**AI-Generated Risk Summary**

An LLM (via Ollama – Gemma model) was integrated to automatically generate an executive-level fraud risk report based on computed fraud metrics.

The model:

Summarizes key fraud patterns

Identifies major risk drivers

Provides business recommendations

📈 **Dashboard Features**
1️⃣ Fraud Risk Comparison

Domestic vs Foreign transaction risk analysis

2️⃣ Merchant Category Analysis

Fraud amount vs fraud rate by category

3️⃣ Velocity-Based Risk

Fraud trends based on transaction velocity (last 24h)

4️⃣ Device Trust Segmentation

Fraud distribution across High, Medium, and Low trust groups

5️⃣ Risk Matrix

Combined risk segmentation using behavioral indicators

🔍 **Key Insights**

Foreign transactions show significantly higher fraud rates than domestic.

High transaction velocity correlates with elevated fraud risk.

Low device trust scores indicate increased fraud probability.

Grocery and Travel categories contribute higher fraud amounts.

🛠 **Tools Used**

Python – Data preprocessing & feature engineering

SQL – Data analysis & fraud rate calculations

Power BI – Interactive dashboard development   

Ollama (Gemma LLM) – Automated risk summary generation  

💡 **Business Recommendations**

Strengthen monitoring for foreign and high-velocity transactions

Implement additional verification for low device trust scores

Introduce dynamic risk-based fraud scoring

🚀 **Future Improvements**

Integrate real-time fraud detection

Implement machine learning risk scoring model

Deploy automated alert system

**How to Run**  
1. Install requirements
2. Run Python script for EDA
3. Use Power BI to open .pbix
