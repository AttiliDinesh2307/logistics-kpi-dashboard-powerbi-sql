# Logistics Performance Dashboard -- DAX Measures

## Executive Dashboard

### Total Revenue

``` dax
Total Revenue =
SUM(Orders[Invoice_Amount])
```

### Total Orders

``` dax
Total Orders =
COUNTROWS(Orders)
```

### Total Customers

``` dax
Total Customers =
DISTINCTCOUNT(Orders[Customer_ID])
```

### Average Order Value

``` dax
Average Order Value =
DIVIDE([Total Revenue], [Total Orders], 0)
```

### Total Shipping Cost

``` dax
Total Shipping Cost =
SUM(Orders[Shipping_Cost])
```

### Average Delivery Days

``` dax
Average Delivery Days =
AVERAGE(Orders[Delivery_Days])
```

### On-Time Delivery %

``` dax
On-Time Delivery % =
DIVIDE(CALCULATE(COUNTROWS(Orders), Orders[On_Time_Delivery]="Yes"), COUNTROWS(Orders), 0)
```

### SLA Breached %

``` dax
SLA Breached % =
DIVIDE(CALCULATE(COUNTROWS(Orders), Orders[SLA_Breached]="Yes"), COUNTROWS(Orders), 0)
```

### Return Rate %

``` dax
Return Rate % =
DIVIDE(CALCULATE(COUNTROWS(Orders), Orders[Returned]="Yes"), COUNTROWS(Orders), 0)
```

### Average Customer Satisfaction

``` dax
Average Customer Satisfaction =
AVERAGE(Orders[CSAT_Score])
```

## Sales & Customer Analytics

### Repeat Customers

``` dax
Repeat Customers =
CALCULATE(DISTINCTCOUNT(Orders[Customer_ID]), Orders[Repeat_Customer]="Yes")
```

### Repeat Customer %

``` dax
Repeat Customer % =
DIVIDE([Repeat Customers], [Total Customers], 0)
```

## Logistics & Delivery Analytics

### Average Shipping Cost

``` dax
Average Shipping Cost =
AVERAGE(Orders[Shipping_Cost])
```

### Total Carriers

``` dax
Total Carriers =
DISTINCTCOUNT(Orders[Carrier])
```

### Target On-Time Delivery

``` dax
Target On-Time Delivery = 0.95
```

## Warehouse & Financial Analytics

### Average Profit Margin %

``` dax
Average Profit Margin % =
AVERAGE(Orders[Profit_Margin_Percentage]) / 100
```

### Average Warehouse Utilization %

``` dax
Average Warehouse Utilization % =
AVERAGE(Orders[Warehouse_Utilization_Percentage]) / 100
```

### Warehouse Utilization Target

``` dax
Warehouse Utilization Target = 0.85
```

### Paid Invoice %

``` dax
Paid Invoice % =
DIVIDE(CALCULATE(COUNTROWS(Orders), Orders[Payment_Status]="Paid"), COUNTROWS(Orders), 0)
```

# Measure Formatting

  Measure                           Format
  --------------------------------- --------------
  Total Revenue                     Currency (₹)
  Average Order Value               Currency (₹)
  Total Shipping Cost               Currency (₹)
  Average Shipping Cost             Currency (₹)
  Total Orders                      Whole Number
  Total Customers                   Whole Number
  Total Carriers                    Whole Number
  Average Delivery Days             Decimal (2)
  Average Customer Satisfaction     Decimal (2)
  On-Time Delivery %                Percentage
  SLA Breached %                    Percentage
  Return Rate %                     Percentage
  Repeat Customer %                 Percentage
  Average Profit Margin %           Percentage
  Average Warehouse Utilization %   Percentage
  Paid Invoice %                    Percentage
