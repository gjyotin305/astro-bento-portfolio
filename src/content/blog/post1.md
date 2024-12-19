---
layout: ../../layouts/LayoutBlogPost.astro
title: "Bias Removal in Diffusion Models (an agentic approach)"
description: "This project was made during Sem 5 in course Foundational Models and Generative AI"
pubDate: 2024-12-18
category: "projects"
---

# Hi there!

This is my first blog, where I will be sharing my approach of how I tackled Gender Bias in Diffusion Models using VLM and LLM Agents.

## Problem Introduction

<div style="display: flex; align-items: center; gap: 40px;">
  <img src="https://thegradient.pub/content/images/2024/04/gender_gradient_header.jpeg" alt="Gender gradient header" width="300" />
  <img src="https://ideogram.ai/assets/progressive-image/balanced/response/ZUt2AgnDQ4S9lT4d-V0BwQ" alt="Diffusion model example" width="300" height="300"/>
</div>

<br>

Diffusion models have shown remarkable success in generating high-quality synthetic content across various domains. However, they exhibit gender bias, which impacts fairness and reliability. Gender bias manifests in the over- or under-representation of certain genders and the reinforcement of harmful stereotypes in generated outputs. These issues not only degrade model performance but also perpetuate social inequities, necessitating effective mitigation strategies for responsible deployment.

## Methodology

Our proposed framework operates in a two-step process to mitigate gender bias in diffusion models.  

### Step 1: Bias Assessment with Vision-Language Model (VLM)  
1. Input prompts and generated outputs are evaluated using the Vision-Language Model **Llava Next**.  
2. Llava Next computes a **gender bias score**, providing quantifiable insights into the model's performance regarding gender representation.  
   - **Reasoning**: The gender bias score helps identify imbalances in the representation of different genders. It quantifies potential over-representation, under-representation, or stereotypical depictions in the generated outputs, enabling a systematic approach to addressing bias.  

### Step 2: Query Optimization with Language Model (LLM)  
1. The **gender bias score** is relayed to the Language Model **Phi3** for query optimization.  
2. Phi3 modifies the original query by rephrasing or adjusting the prompt to address identified gender biases.  
3. The optimized query is then used to generate more balanced and fair outputs.  

<br>

<div style="text-align: center;">
  <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; align-items: center; justify-items: center;">

  <!-- <img src="https://drive.google.com/thumbnail?id=1N4YCzKzlMU0bcPnWhhIT1Ia58eu9gElL&sz=w1000" alt="Image 1" style="width: 100%; height: auto;" /> -->
  <img src="https://drive.google.com/thumbnail?id=1tlBSKNdEtCllpxv1y1hxvEoSNl3JOdwr&sz=w1000" alt="Image 2" style="width: 100%; height: auto;" />
  <img src="https://drive.google.com/thumbnail?id=1IgwmhZFZsqjJ_jUdZkBc-dE5_TzQSWon&sz=w1000" alt="Image 3" style="width: 100%; height: auto;" />
  <!-- <img src="https://drive.google.com/thumbnail?id=1GHUFaRU1JnNqq3HBn2gQ3REhJqbZ0ks8&sz=w1000" alt="Image 4" style="width: 100%; height: auto;" /> -->
  <img src="https://drive.google.com/thumbnail?id=1H-cKvnwY58ML9X-NeYPhEQO6KPWtJw6j&sz=w1000" alt="Image 5" style="width: 100%; height: auto;" />

  </div>
  <p style="font-size: 14px; color: gray;">Sample Outputs after Bias Mitigation</p>
</div>

<br>

<div style="text-align: center;">
  <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; align-items: center; justify-items: center;">

  <img src="https://drive.google.com/thumbnail?id=1N4YCzKzlMU0bcPnWhhIT1Ia58eu9gElL&sz=w1000" alt="Image 1" style="width: 100%; height: auto;" />
  <!-- <img src="https://drive.google.com/thumbnail?id=1tlBSKNdEtCllpxv1y1hxvEoSNl3JOdwr&sz=w1000" alt="Image 2" style="width: 100%; height: auto;" /> -->
  <!-- <img src="https://drive.google.com/thumbnail?id=1IgwmhZFZsqjJ_jUdZkBc-dE5_TzQSWon&sz=w1000" alt="Image 3" style="width: 100%; height: auto;" /> -->
  <img src="https://drive.google.com/thumbnail?id=1GHUFaRU1JnNqq3HBn2gQ3REhJqbZ0ks8&sz=w1000" alt="Image 4" style="width: 100%; height: auto;" />   
  <img src="https://drive.google.com/thumbnail?id=13QiYcDfYRuEJeTj0VIxbYCfxP50Z3bcb&sz=w1000" alt="Image 4" style="width: 100%; height: auto;" />   
  <!-- <img src="https://drive.google.com/thumbnail?id=1H-cKvnwY58ML9X-NeYPhEQO6KPWtJw6j&sz=w1000" alt="Image 5" style="width: 100%; height: auto;" /> -->

  </div>
  <p style="font-size: 14px; color: gray;">Sample Outputs before Bias Mitigation</p>
</div>

## Further Work

- I was planning on use a small LLM < 1B parameters finetuned for debiasing prompts/queries to these models to act also as a sort of guard rail to the whole system.

- I am planning to then host it, on our servers at [RAID](https://raid.iitj.ac.in/), so that people can use it to debias, safeguard their image generation models, to not generate biased content.

- For more ideas, please contact me at `b22ai063@iitj.ac.in` or `gjyotin305@gmail.com`.

## Limitations

- This approach does not affect the model at all, and can only work limited to Prompts, so in case if the model itself is biased it won't help in that situation. For situations like that [Unified Concept Editing](https://unified.baulab.info/) is more appropriate.


