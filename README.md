# University Major Selection Expert System (CLIPS)

A rule-based expert system built in CLIPS to recommend suitable university majors based on students’ skills, interests, personality, and career goals.  
This project was developed for IS425 – Intelligent Systems at Princess Nourah bint Abdulrahman University.

---

# Inference Method – Forward Chaining

The system starts with user-provided facts (e.g., interests, preferred subjects) and applies predefined rules until it reaches a suitable conclusion.

Steps:
1. Data Collection – student inputs preferences  
2. Rule Application – system compares inputs with its knowledge base  
3. Conclusion – matches student profile to the best-fit major(s)

---
# How to Run:
1. Open CLIPS.
2. Load the file:
   (load "projectCode.clp")
3. Reset the environment:
   (reset)
4. Start the system:
   (run)
5. Answer the questions as prompted.
6. The system will display a recommended major.

# Example:
CLIPS> (load "projectCode.clp")
CLIPS> (reset)
CLIPS> (run)
Question: Do you enjoy science subjects (Biology, Chemistry)?
Answer: yes

Question: Do you have skills like memorization, communication, and handling pressure?
Answer: yes

Best fit: Medicine, Nursing, Pharmacy 
