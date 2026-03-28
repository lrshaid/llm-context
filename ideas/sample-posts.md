---
created: 2026-03-16
updated: 2026-03-16
tags:
  - type/idea
  - brand
  - writing
---

# Sample Posts -- Personal Brand

## LinkedIn Post 1 -- Pillar: AI for the Data Practitioner

I've been an analytics engineer for 7 years. SQL, dbt, pipelines, dashboards -- the usual.

Last year I started integrating LLMs into my actual workflow. Not as a toy. As a tool.

Here's what actually works:

> Generating dbt model documentation from source schema + business context
> Writing first-draft SQL from plain English specs (then reviewing it like a PR)
> Automating data quality checks -- describe the rule in words, get the test
> Building portable context systems so every AI tool I use knows my stack

Here's what doesn't work (yet):

> Letting LLMs write production pipeline logic unsupervised
> "AI-powered dashboards" that nobody asked for
> Replacing domain knowledge with prompt engineering

The engineers who'll win aren't the ones who know the most about AI.
They're the ones who know their domain deeply enough to use AI where it matters.

What's one place you've actually found LLMs useful in your data work?

---

## LinkedIn Post 2 -- Pillar: From BI to AI

3 years ago my entire job was building dashboards.

Today I'm building systems that use LLMs to automate parts of the analytics workflow.

The transition wasn't "learn Python and transformers." It was much simpler:

1. I already understood the data. That's 80% of the value.
2. I already thought in systems -- pipelines, dependencies, orchestration.
3. I already spoke business. AI without business context is just expensive autocomplete.

The biggest shift? Going from "build what was requested" to "build what's possible."

BI trained me to answer questions. AI lets me automate the answers.

If you're in BI/analytics and wondering whether AI is for you -- it is. You already have the hardest part: domain knowledge.

---

## X Thread -- Pillar: AI for the Data Practitioner

5 things LLMs are actually good at in data engineering (from someone who does this daily):

1/ Writing dbt docs.
Nobody likes writing descriptions for 200 columns. Give the LLM the schema + a few examples and review the output. 10x faster, 90% accurate.

2/ First-draft SQL from specs.
"Revenue by channel, last 90 days, excluding refunds." Paste that into Claude with your schema context. You'll still review it, but the blank page problem is gone.

3/ Data quality rules in plain English.
"Flag any order where total < sum of line items." Turns into a dbt test in seconds.

4/ Explaining legacy code.
That 400-line stored procedure nobody wants to touch? LLMs are great at reading code you don't want to read.

5/ Building portable context.
I keep a repo with my full profile, stack, and project context. Every LLM I use gets the same starting point. No re-explaining.

What's NOT on this list: replacing your judgment, writing production code unsupervised, or making dashboards "with AI."

---

## X Hot Take -- Pillar: Business-Minded Tech

Most "AI for analytics" startups are building solutions for a problem that takes 5 minutes in SQL.

The hard part of analytics was never writing the query.

It was knowing which question to ask.

---

## LinkedIn Post 3 -- Pillar: Business-Minded Tech

Every data project I've worked on had a dollar figure attached to it.

Not because I'm obsessed with ROI -- because that's how you get buy-in, keep funding, and prove the work matters.

Here's a simple framework:

1. What decision does this enable?
2. What's the cost of making that decision wrong (or late)?
3. How much faster/better does this project make that decision?

If you can't answer those three questions, you don't have a data project. You have a science experiment.

Nothing wrong with experiments. Just don't sell them as projects.

---

## X Post -- Pillar: Building in Public

I built a "portable memory" system for working with LLMs.

It's a git repo with my profile, project context, rules, and ideas.

Every new conversation with any LLM starts by pulling the latest version.

Why: I got tired of re-explaining who I am, what I'm working on, and how I like to work.

Now it's automatic. One repo, synced every 4 hours, works with Claude, ChatGPT, anything.

Open to sharing the setup if anyone's interested.

See also: [[personal-brand-plan]], [[writing-style-x]], [[user_writing_style_x]]
