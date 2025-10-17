;;; University Major Expert System
;;;===============================
;;****************
;;* DEFFUNCTIONS *
;;****************
(deffunction ask-question (?question $?allowed-values)
 (printout t ?question)
 (bind ?answer (read))
 (if (lexemep ?answer)
 then (bind ?answer (lowcase ?answer)))
 (while (not (member ?answer ?allowed-values)) do
 (printout t ?question)
 (bind ?answer (read))
 (if (lexemep ?answer)
 then (bind ?answer (lowcase ?answer))))
 ?answer)
(deffunction yes-or-no-p (?question)
 (bind ?response (ask-question ?question yes no y n))
 (if (or (eq ?response yes) (eq ?response y))
 then yes
 else no))
 
 
;;=========================
;;* STARTUP INTRO MESSAGE *
;;=========================
(defrule system-banner ""
 (declare (salience 10))
 =>
 (printout t crlf "University Major Selection Expert System" crlf crlf))
 
 
;;===================
;;* MAIN QUESTIONS *
;;===================

(defrule ask-science ""
 (not (answered science))
 =>
 (assert (science (yes-or-no-p "Do you enjoy science subjects like Biology or Chemistry?
(yes/no): ")))
 (assert (answered science)))
 
(defrule ask-memorization ""
 (science yes)
 (not (answered memorization))
   (not (suggestion ?any))
 =>
 (assert (memorization (yes-or-no-p "Do you have memorization and communication skills?
(yes/no): ")))
 (assert (answered memorization)))
 
(defrule ask-lab ""
 (science yes)
 (memorization no)
 (not (suggestion ?any))

 (not (answered lab))
 =>
 (assert (lab (yes-or-no-p "Do you prefer working in a lab? (yes/no): ")))
 (assert (answered lab)))
 
 ;;=================== blue

 (defrule ask-math-physics ""
  (science no)
 (not (answered math-physics))
   (not (suggestion ?any))

 =>
 (assert (math-physics (yes-or-no-p "Do you enjoy Math or Physics? (yes/no): ")))
 (assert (answered math-physics)))
 
(defrule ask-problem-solving ""
  (science no)
 (math-physics yes)
 (not (answered problem-solving))
   (not (suggestion ?any))

 =>
 (assert (problem-solving (yes-or-no-p "Do you have problem-solving and logical thinking
skills? (yes/no): ")))
 (assert (answered problem-solving)))
 
(defrule ask-design ""
  (science no)
 (math-physics yes)
 (problem-solving no)
 (not (answered design))
  (not (suggestion ?any))
 =>
 (assert (design (yes-or-no-p "Do you enjoy design and innovation? (yes/no): ")))
 (assert (answered design)))
 
 
 (defrule ask-programming ""
   (science no)
 (math-physics no)
 (not (answered programming))
   (not (suggestion ?any))
 =>
 (assert (programming (yes-or-no-p "Do you enjoy programming or working with
computers? (yes/no): ")))
 (assert (answered programming)))
 
(defrule ask-analytical-thinking ""
 (science no)
  (math-physics no)
 (programming yes)
 (not (answered analytical))
   (not (suggestion ?any))
 =>
 (assert (analytical (yes-or-no-p "Are you good at analytical thinking and working
independently? (yes/no): ")))
 (assert (answered analytical)))
 
(defrule ask-cybersecurity ""
   (science no)
  (math-physics no)
  (programming yes)
  (analytical no)
  (not (answered cybersecurity))
  (not (suggestion ?any))
 =>
 (assert (cybersecurity (yes-or-no-p "Are you interested in cybersecurity? (yes/no): ")))
 (assert (answered cybersecurity)))
 
 
 
  ;;=================== pink
  
  ;;==============================
;;* QUESTIONS: Literary Subjects *
;;==============================
(defrule ask-literary ""
  (science no)
   (math-physics no)
    (programming no)
 (not (answered literary))
   (not (suggestion ?any))
 =>
 (assert (literary (yes-or-no-p "Do you enjoy literary subjects like Language, History, or
Social Studies? (yes/no): ")))
 (assert (answered literary)))
 
(defrule ask-writing ""
  (science no)
     (math-physics no)
      (programming no)
 (literary yes)
 (not (answered writing))
   (not (suggestion ?any))
 =>
 (assert (writing (yes-or-no-p "Do you have strong writing and expression skills? (yes/no): ")))
 (assert (answered writing)))
 
(defrule ask-translation ""
  (science no)
     (math-physics no)
      (programming no)
 (literary yes)
 (writing no)
 (not (answered translation))
   (not (suggestion ?any))
 =>
 (assert (translation (yes-or-no-p "Do you enjoy translation or learning languages? (yes/no):
")))
 (assert (answered translation)))
 

 
 ;;=============================
;;* QUESTIONS: Business *
;;=============================

(defrule ask-business ""
  (science no)
     (math-physics no)
      (programming no)
 (not (answered business))
   (not (suggestion ?any))
 =>
 (assert (business (yes-or-no-p "Are you interested in business or management? (yes/no):
")))
 (assert (answered business)))
 
(defrule ask-leadership ""
  (science no)
     (math-physics no)
      (programming no)
 (business yes)
 (not (answered leadership))
   (not (suggestion ?any))
 =>
 (assert (leadership (yes-or-no-p "Do you have leadership and organizational skills?
(yes/no): ")))
 (assert (answered leadership)))
 
(defrule ask-numbers ""
  (science no)
     (math-physics no)
      (programming no)
 (business yes)
 (leadership no)
 (not (answered numbers))
   (not (suggestion ?any))
 =>
 (assert (numbers (yes-or-no-p "Do you prefer working with numbers? (yes/no): ")))
 (assert (answered numbers)))

 ;;========================
;;* QUESTIONS: Arts *
;;========================

(defrule ask-arts ""
  (science no)
     (math-physics no)
   (business no)
 (not (answered arts))
   (not (suggestion ?any))
 =>
 (assert (arts (yes-or-no-p "Do you enjoy arts or design? (yes/no): ")))
 (assert (answered arts)))
 
(defrule ask-drawing ""
 (business no)
    (math-physics no)
 (arts yes)
 (not (answered drawing))
   (not (suggestion ?any))
 =>
 (assert (drawing (yes-or-no-p "Are you skilled in drawing or creativity? (yes/no): ")))
 (assert (answered drawing)))
 

(defrule ask-photo ""
  (science no)
     (math-physics no)
  (business no)
 (arts yes)
 (drawing no)
 (not (answered photo))
   (not (suggestion ?any))
 =>
 (assert (photo (yes-or-no-p "Do you enjoy photography or directing? (yes/no): ")))
 (assert (answered photo))) 
 
 
;;=====================
;;* FINAL SUGGESTIONS *
;;=====================
(defrule suggest-medicine ""
 (science yes)
 (memorization yes)
 =>
 (assert (suggestion "Best Fit Major: Medicine, Nursing, Pharmacy")))
 
(defrule suggest-lab-science ""
 (science yes)
 (memorization no)
 (lab yes)
 =>
 (assert (suggestion "Best Fit Major: Medical Laboratory Science, Microbiology")))
 
(defrule suggest-biotech ""
 (science yes)
 (memorization no)
 (lab no)
 =>
 (assert (suggestion "Best Fit Major: Public Health, Biotechnology")))
 
 
 ;;==============================
;;* SUGGESTIONS: STEM Blue Path *
;;==============================
(defrule suggest-engineering-applied ""
(science no)
 (math-physics yes)
 (problem-solving yes)
 =>
 (assert (suggestion "Best Fit Major: Engineering, Applied")))
(defrule suggest-architecture ""
(science no)
 (math-physics yes)
 (problem-solving no)
 (design yes)
 =>
 (assert (suggestion "Best Fit Major: Architecture, Interior Design")))
 
 (defrule suggest-materials-science ""
 (science no)
 (math-physics yes)
 (problem-solving no)
 (design no)
 =>
 (assert (suggestion "Best Fit Major: Materials Science, Industrial Engineering")))
(defrule suggest-cs-software ""
(science no)
 (math-physics no)
 (programming yes)
 (analytical yes)
 =>
 (assert (suggestion "Best Fit Major: Computer Science, Software Engineering")))
 
(defrule suggest-cybersecurity ""
(science no)
 (programming yes)
 (analytical no)
 (cybersecurity yes)
 =>
 (assert (suggestion "Best Fit Major: Cybersecurity")))
(defrule suggest-it ""
(science no)
 (programming yes)
 (analytical no)
 (cybersecurity no)

 =>
 (assert (suggestion "Best Fit Major: Information Systems, IT")))
 
 ;;====== pink sugg 
  

   
 ;;==============================
;;* SUGGESTIONS: Literary *
;;==============================

(defrule suggest-media ""
  (science no)
(math-physics no)
 (programming no)
 (literary yes)
 (writing yes)
 =>
 (assert (suggestion "Best Fit Major: Media, Arabic Language, Journalism")))
 
(defrule suggest-translation ""
  (science no)

(math-physics no)
 (programming no)
 (literary yes)
 (writing no)
 (translation yes)
 =>
 (assert (suggestion "Best Fit Major: Languages and Translation")))
 
(defrule suggest-sociology ""
  (science no)
(math-physics no)
 (programming no)
 (literary yes)
 (writing no)
 (translation no)
 =>
 (assert (suggestion "Best Fit Major: Sociology, Psychology"))) 
 
 ;;============================
;;* SUGGESTIONS: Business *
;;============================

(defrule suggest-admin ""
  (science no)

(math-physics no)
 (programming no)
 (business yes)
 (leadership yes)
 =>
 (assert (suggestion "Best Fit Major: Business Administration, Entrepreneurship")))
 
(defrule suggest-accounting ""
  (science no)

(math-physics no)
 (programming no)
 (business yes)
 (leadership no)
 (numbers yes)
 =>
 (assert (suggestion "Best Fit Major: Accounting, Finance")))
   (science no)

(defrule suggest-marketing ""
 (business yes)
 (leadership no)
 (numbers no)
 =>
 (assert (suggestion "Best Fit Major: Marketing, Human Resources")))
 
 

 ;;=========================
;;* SUGGESTIONS: Arts *
;;=========================
(defrule suggest-finearts ""
  (science no)
(math-physics no)
 (programming no)
 (arts yes)
 (drawing yes)
 =>
 (assert (suggestion "Best Fit Major: Fine Arts, Graphic Design")))
 
(defrule suggest-visual ""
  (science no)
(math-physics no)
 (programming no)
 (arts yes)
 (drawing no)
 (photo yes)
 =>
 (assert (suggestion "Best Fit Major: Visual Media, Digital Production")))
 
(defrule suggest-fashion ""
  (science no)
(math-physics no)
 (programming no)
 (arts yes)
 (drawing no)
 (photo no)
 =>
 (assert (suggestion "Best Fit Major: Fashion Design, Interior Decoration")))
 
 (defrule suggest-law ""
  (science no)
(math-physics no)
 (programming no)
 (literary no)
 (business no)
 (arts no)
 =>
 (assert (suggestion "Best Fit Major: Law, relations ")))
 
 
;;=======================
;;* SHOW FINAL OUTPUT *
;;=======================
(defrule show-suggestion ""
 (suggestion ?text)
 =>
 (printout t crlf ?text crlf)) 