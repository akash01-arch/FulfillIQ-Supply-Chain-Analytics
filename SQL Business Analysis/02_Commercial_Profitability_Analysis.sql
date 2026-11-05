-- ============================================================
-- 1. HIGH-SALES LOSS-MAKING PRODUCTS
-- Find products with significant sales but negative profit.
-- ============================================================

select
    "Product Name" as product_name,
    round(sum("Sales")::numeric, 2) as revenue,
    round(sum("Order Profit Per Order")::numeric, 2) as profit,
    round(
        (
            sum("Order Profit Per Order") /
            nullif(sum("Sales"), 0) * 100
        )::numeric,
        2
    ) as profit_margin,
    round(
        (avg("Order Item Discount Rate") * 100)::numeric,
        2
    ) as avg_discount
from supply_chain_orders
group by "Product Name"
having sum("Sales") > 1000
   and sum("Order Profit Per Order") < 0
order by revenue desc;

/*
Business Insight:
High-sales loss-making products are immediate candidates
for pricing, discount, procurement, and shipping-cost reviews.
*/


-- ============================================================
-- 2. MARKET PROFITABILITY RANKING
-- Rank markets from most to least profitable.
-- ============================================================

select
    "Market" as market,
    round(sum("Sales")::numeric, 2) as revenue,
    round(sum("Order Profit Per Order")::numeric, 2) as profit,
    round(
        (
            sum("Order Profit Per Order") /
            nullif(sum("Sales"), 0) * 100
        )::numeric,
        2
    ) as profit_margin,
    dense_rank() over (
        order by
            sum("Order Profit Per Order") /
            nullif(sum("Sales"), 0) desc
    ) as profitability_rank
from supply_chain_orders
group by "Market"
order by profitability_rank;

/*
Business Insight:
This gives management a clear profitability benchmark
across markets and highlights markets requiring
financial improvement.
*/


-- ============================================================
-- 3. TOP 20 CUSTOMERS BY PROFIT
-- Which customers generate the greatest financial value?
-- ============================================================

select
    "Order Customer Id" as customer_id,
    count(distinct "Order Id") as total_orders,
    round(sum("Sales")::numeric, 2) as revenue,
    round(sum("Order Profit Per Order")::numeric, 2) as profit,
    round(
        (
            sum("Sales") /
            nullif(count(distinct "Order Id"), 0)
        )::numeric,
        2
    ) as avg_order_value,
    rank() over (
        order by sum("Order Profit Per Order") desc
    ) as customer_rank
from supply_chain_orders
group by "Order Customer Id"
order by customer_rank
limit 20;

/*
Business Insight:
High-profit customers are strong candidates for retention
programs, personalized offers, and premium customer service.
*/


-- ============================================================
-- 4. CATEGORY PERFORMANCE & DELIVERY RISK
-- Which product categories combine strong financial
-- performance with poor delivery reliability?
-- ============================================================

select
    "Category Name" as category_name,
    count(distinct "Order Id") as total_orders,
    round(sum("Sales")::numeric, 2) as revenue,
    round(sum("Order Profit Per Order")::numeric, 2) as profit,
    round(
        (
            sum("Order Profit Per Order") /
            nullif(sum("Sales"), 0) * 100
        )::numeric,
        2
    ) as profit_margin,
    round(
        (avg("Late_delivery_risk") * 100)::numeric,
        2
    ) as late_delivery_pct
from supply_chain_orders
group by "Category Name"
order by revenue desc;

