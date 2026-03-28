---
created: 2026-03-23
updated: 2026-03-24
tags:
  - type/reference
  - career
  - interview
aliases:
  - interview prep
---

# Interview Answers

## Tell us what shaped you (3 parts + one-line goal)

**Early influences**
I've always been drawn to business problems -- spotting inefficiencies, pulling them apart, figuring out how to fix them. That curiosity led me to Industrial Engineering, where I learned to see every business as a system with levers to pull.

**Key turning point**
My first job threw me into an oil & gas company to automate their data. Their systems were a mess (spreadsheets everywhere, no visibility). I built an automated system that showed refinery performance. The moment the operators saw it, their faces said everything. The real impact isn't in the data, it's in making it visible to the people who need it.

**What drives me now**
I love building systems that scale -- systems that tell you how the business is actually doing, what the next move should be, and which levers to turn when something's off. Customer behavior analytics, forecast models, demand intelligence -- building decision engines that drive action.

**One-line goal:** Build analytics systems that turn complex data into the next best decision.

---

## Describe your experience building core business metrics from scratch

I've built core business metrics from scratch in both consulting and in-house roles.

In consulting, I joined turnaround engagements where companies had no reliable numbers. I aligned stakeholders on metric definitions, built financial models -- revenue attribution, GMROI, true margin, utilization -- and delivered within weeks.

In-house, I owned the full analytics stack. I built customer LTV by cohort, purchase frequency models, customer propensity scores, demand forecasts tied to inventory planning, reliable inventory metrics across channels, finance reconciliation pipelines, and product defect analysis. I took disconnected data across e-commerce and retail and turned it into a single source of truth that merchandising, marketing, finance, and ops relied on to make decisions.

---

## Explain how you have designed analytical or metric models using first-principles thinking

I start from the business need: what's the problem, and what can I build to help them succeed?

For customer propensity, I broke it down to raw signals -- recency, frequency, category affinity, time between purchases -- and built from there instead of importing a generic framework.

For inventory, I decomposed "right product, right place, right time" into sell-through rate, weeks of supply, and reorder velocity -- each tied to the actual cost of getting it wrong.

For profitability, I rebuilt the P&L at the product level from raw transactions. Revenue minus COGS isn't margin -- returns, discounts, shipping, and fulfillment were hiding where money was actually lost.

The principle is always the same: decompose into the smallest measurable parts, validate each one and build up.

---

## Talk about your hands-on experience using Google Sheets and BigQuery

Google Sheets and BigQuery are my daily tools -- I use them together across every project.

BigQuery is where the heavy lifting happens. We have a full data warehouse following a layered pattern: raw ingestion, staging, dimension and fact tables, then visualization-ready aggregations -- all modeled in SQL + dbt for readability and maintainability. I write the transformations, schedule the pipelines, and own the data quality.

Google Sheets is the POC delivery layer -- we use it for quick turnarounds or temporary analysis we don't expect to last long term. I connect it directly to BigQuery via connected sheets or export key outputs, then build interactive templates that teams can use without depending on me. When something needs to scale, I move it to a reporting tool like Looker or Omni.

The combination works because BigQuery handles scale and complexity, Sheets handles speed, and reporting tools handle long-term accessibility. We have this stack powering everything from demand forecasting models to customer cohort analyses to finance reconciliation workflows.

---

## Describe your experience working with Funnel data

I've worked with funnel data mainly in e-commerce -- tracking sessions through to purchase, segmented by channel and customer type. The goal was always to understand where drop-off happens and where spend is actually converting.

On the event tracking side, I've used Segment to manage event collection and route data to downstream tools and warehouses -- having clean, consistent events is what makes funnel analysis reliable.

---

## Share an example of how you partnered with engineering

Most of my work with engineering is with the teams building the systems that generate the data -- order management, product syncs, inventory.

When something's off in the data, I go to the source. Shipment dates don't match fulfillment? I sit with engineering and walk through how the order routing is capturing statuses. Product attributes breaking a report? I trace it back to the sync between the PIM and the warehouse.

See also: [[user_profile]], [[project_stackoverflow_analysis]]
