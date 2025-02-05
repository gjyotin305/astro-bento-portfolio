---
layout: ../../layouts/LayoutBlogPost.astro
title: "The Prometeo AI Infrastructure Blog"
description: "An inhouse LLM for Indian Institute of Technology Jodhpur's Technological Fest [Saga]"
pubDate: 2025-2-05
category: "projects"
---

# Deploying Saga: The 7B LLM Model for Prometeo 2025

Prometeo, the biggest techno-entrepreneurial fest of North-Western India, is an event that brings together innovators, tech enthusiasts, and entrepreneurs. As the head of technical events for Prometeo 2025, I had the opportunity to deploy **Saga**, a 7B parameter Large Language Model (LLM) for real-time interaction with attendees. Our theme this year was **Nordic Nights**, a blend of Scandinavian culture and futuristic technology.To test it out, you can visit [here](https://www.prometeo.in/ca)

![SAGA](https://ideogram.ai/assets/image/lossless/response/GigXbhpQTpykyHM-qNd1gA)

## System Architecture

Deploying Saga for a live event required a robust infrastructure to handle real-time queries efficiently. Here’s a high-level breakdown of the system:

### 1. **Model Selection & Setup**
   - We used a **7B parameter Qwen-like model**, optimized for conversational AI. Context Length of the model was set as "8192". (Ollama Internally uses RoPE Scaling([here](https://medium.com/@ngiengkianyew/understanding-rotary-positional-encoding-40635a4d078e))).
   - Given Context with event-specific data: Prometeo’s history, event schedules, Nordic mythology, and general tech knowledge.

### 2. **Infrastructure & Deployment**
   - **Inference Server:** Deployed on a GPU-based local instance(3 A5000 Servers) with **Ollama** for optimized token streaming.
   - **Load Balancing:** Utilized Nginx LoadBalancer to balance load between the servers.
   - **API Gateway:** Implemented via **FastAPI + Nginx** to route queries efficiently.

<div>
   <center>
    <img src="../public/sys_arch.png" alt="System Architecture">
   </center>
</div>

## Some statistics on SAGA

### The above stats are for 15 requests total time.

### Prompt Eval Count: 
It is the number of times a given prompt was evaluated by the LLM when generating a response.

<div>
   <center>
    <img src="../public/prompt_eval_count_performance_1.png" alt="System Architecture">
   </center>
</div>

### Prompt Eval duration:
It is the time spent generating the response.

<div>
   <center>
    <img src="../public/prompt_eval_duration_performance_1.png" alt="System Architecture">
   </center>
</div>

**Note: Y axis represents ms (milliseconds)**

### Eval Count: 
It is the number of tokens in the response

<div>
   <center>
    <img src="../public/eval_count_performance_1.png" alt="System Architecture">
   </center>
</div>

### Total Duration:
It refers to the overall time it takes for the language model to process a prompt and generate a response, including the time spent loading the model, evaluating the prompt, and generating the text, essentially representing the complete execution time of a single query. 

<div>
   <center>
    <img src="../public/total_duration_performance_1.png" alt="System Architecture">
   </center>
</div>

**Note: Y axis represents ms (milliseconds)**

### Load Duration
The time taken to basically load and unload the model to the GPU.

<div>
   <center>
    <img src="../public/load_duration_performance_1.png" alt="System Architecture">
   </center>
</div>

**Note: All Experiments were done on an A5000.**

## Technical Challenges & Solutions

### **1. Managing Latency for Live Queries**
   - Initially, responses took **4-5 seconds**, which was too slow for real-time interaction.
   - Optimized inference with **4-bit quantization** and **flash attention**, bringing response time down to ~1.2 seconds, along with streaming, our tokens per second were around ~100toks/second at best.

### **2. Handling High Query Volume**
   - During peak hours, over **500 concurrent users** accessed Saga.
   - Implemented **request batching & dynamic model offloading** to manage the load efficiently.

### **3. Context Retention in Conversations**
   - Users wanted follow-up responses to previous questions.
   - Used a **context window of 1024 tokens** and session-based memory using Redis.

### **4. Competitor Q/A**
   - Giving good answers when asked questions like "Is IITJ > IITB" or "How is Prometeo better than TechFest IITB?" so that no institution is undermined was also a task, while maintaining the user persona.

### **5. Huge Startup Time**
   - One Major problem, was that after usage after a long time, the model took quite some time to load.

## How Did People Use Saga?

Saga was utilized in various ways throughout the event:

- **Event Information:** Users asked about schedules, speakers, and locations.
- **Tech Q&A:** Queries related to AI, blockchain, and quantum computing.
- **Nordic Mythology Trivia:** A fun element where attendees quizzed Saga on Norse legends.
- **Casual Conversations:** Some just chatted with it for entertainment!

## Overall Experience & Takeaways

Deploying an LLM for a live event was an exhilarating challenge. Seeing people interact with Saga, a model we fine-tuned and optimized in real time, was incredibly fulfilling. Some key learnings:

- **Efficient inference is crucial** – optimizing response times made the chatbot feel much more engaging.
- **User engagement is unpredictable** – people used the bot in ways we hadn’t anticipated!
- **Scaling matters** – dynamic load balancing was essential to maintaining uptime during peak usage.

I want to try out speculative decoding and other methods for faster inference as well, maybe for Prometeo 2026 or some other task.

### **IIT Jodhpur: A Leader in LLM Innovation**

One of the standout aspects of this project is that **IIT Jodhpur is among the only institutes to host and deploy its own Large Language Model (LLM)**. This initiative showcases our commitment to AI research and deployment, setting us apart as a hub for cutting-edge technological advancements. The success of this deployment highlights IITJ’s growing expertise in foundational models and AI-driven applications.

<br>

---

If you're interested in LLM deployment, let’s connect! Would love to discuss more on **model serving, inference optimization, and real-world applications.** 🚀 [@github](https://github.com/gjyotin305) or [@email](mailto:jyotinofficialcc@gmail.com)
<br>
<br>