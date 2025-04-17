# 🚀 Azure Synapse Link with Azure Cosmos DB

This project demonstrates how to implement **HTAP (Hybrid Transactional and Analytical Processing)** using **Azure Synapse Analytics** and **Azure Cosmos DB with analytical store**.

It showcases how real-time operational data stored in Cosmos DB can be queried directly from Synapse using both **Spark notebooks** and **serverless SQL pools** — with **no ETL required**.

---

## 🛠️ Technologies Used

- **Azure Cosmos DB** (NoSQL, Analytical Store enabled)
- **Azure Synapse Analytics**
  - Spark Pool
  - Serverless SQL Pool
- **PySpark**
- **T-SQL**
- **Azure Portal / Synapse Studio**

---

## 📊 Data Scenario

Manually entered sales data with nested customer details stored in Cosmos DB:

```json
{
  "id": "SO43708",
  "orderdate": "2019-07-02",
  "customerid": 126,
  "customerdetails": {
    "customername": "Samir Nadoy",
    "customeremail": "samir1@adventure-works.com"
  },
  "product": "Road-150 Black, 48",
  "quantity": 1,
  "price": 3578.27
}
