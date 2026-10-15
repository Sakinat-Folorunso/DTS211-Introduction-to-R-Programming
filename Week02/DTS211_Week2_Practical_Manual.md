# DTS 211 — Week 2 Practical Manual
## Evaluation in R and R Objects

**Course:** DTS 211 — Introduction to R Programming  
**Week:** 2  
**Environments:** RStudio Desktop or Posit Cloud

## 1. Purpose

This practical develops your ability to evaluate expressions, assign values to objects, create numeric/character/logical objects, perform basic computations, and inspect objects with `class()`, `typeof()`, `str()` and `attributes()`.

### Learning goals

By the end, you should be able to:
- run and interpret R expressions;
- create, name and reassign objects;
- perform calculations using stored values;
- distinguish numeric, character and logical values;
- inspect objects and their attributes;
- investigate common beginner errors.

## 2. Prepare your workspace

1. Open the DTS 211 RStudio project you created in Week 1, or open RStudio in Posit Cloud.
2. Open the `Week02` folder in the course repository.
3. Open `DTS211_Week2_Practical_RStudio.R`, or copy the script into a new R script in your project.
4. Save your work as `My_Week2_Practical.R`.

Use the same R script in RStudio Desktop and Posit Cloud. Save your work regularly.

## 3. Activity 1 — Evaluate expressions

Predict each result, then run the code:

```r
5 + 3
10 * 4
20 / 5
2^3
2 + 3 * 4
(2 + 3) * 4
7 %% 3
7 %/% 3
```

**Record:** Which expression surprised you? Explain why parentheses changed the result in one example.

## 4. Activity 2 — Assign and reuse values

```r
test1 <- 68
test2 <- 74
assignment <- 82

test1
test2
assignment

total <- test1 + test2 + assignment
average <- total / 3

total
average
```

Answer:
1. What does `<-` do?
2. What happens when you enter an object name by itself?
3. Why are `total` and `average` useful objects?

## 5. Activity 3 — Calculation versus reassignment

Run:

```r
score <- 75
score + 5
score
```

Now run:

```r
score <- score + 5
score
```

Explain the difference. Do not assume that displaying a calculation automatically changes a stored object.

## 6. Activity 4 — Naming objects

```r
student_score <- 75
Student_score <- 80

student_score
Student_score
```

Observe that R is case-sensitive. Use meaningful names such as `student_score`, `test_average` and `registration_status`.

## 7. Activity 5 — Create different kinds of objects

```r
student_name <- "Amina"
age <- 21
registered <- TRUE

student_name
age
registered
```

Inspect each object:

```r
class(student_name)
typeof(student_name)
str(student_name)

class(age)
typeof(age)
str(age)

class(registered)
typeof(registered)
str(registered)
```

In your own words, describe what each inspection function tells you.

## 8. Activity 6 — Compare values that look similar

```r
a <- 25
b <- "25"
c <- 25L
d <- 25.0

class(a)
typeof(a)

class(b)
typeof(b)

class(c)
typeof(c)

class(d)
typeof(d)
```

Use `str()` on all four objects. Record what you notice about the value written as text and the value written with the `L` suffix.

## 9. Activity 7 — Logical evaluation

```r
score <- 72
passed <- score >= 50

passed
class(passed)
typeof(passed)
str(passed)
```

Change the score:

```r
score <- 42
passed <- score >= 50
passed
```

Explain how R evaluates the comparison and stores the result.

## 10. Activity 8 — Attributes

```r
score <- 75
attributes(score)
```

Now attach a descriptive attribute:

```r
attr(score, "description") <- "A student's assessment score"

attributes(score)
attr(score, "description")
str(score)
```

Explain what changed and what did not change.

## 11. Activity 9 — Student record mini-task

Create the objects below and complete the calculations:

```r
student_name <- "Amina"
age <- 21
test1 <- 68
test2 <- 74
assignment <- 82
registered <- TRUE

total <- test1 + test2 + assignment
average <- total / 3
passed <- average >= 50
```

Then:
1. Display `student_name`, `total`, `average` and `passed`.
2. Inspect `student_name`, `age`, `average`, `registered` and `passed` with `class()`, `typeof()` and `str()`.
3. Change `test2` to `90`.
4. Recalculate `total`, `average` and `passed`.
5. Explain why the calculations need to be run again after the input value changes.

## 12. Troubleshooting

- **Object not found:** check whether you ran the assignment line and whether the spelling/capitalisation matches.
- **Unexpected text error:** check that text values are enclosed in quotation marks.
- **Unexpected result:** inspect the relevant objects and run code one section at a time.
- **Value did not change:** distinguish between evaluating an expression and assigning its result back to an object.

## 13. Independent challenge

Create a script containing:
- one character object for a student's name;
- one numeric object for age;
- three numeric assessment scores;
- one logical object for registration status;
- calculations for total and average;
- a logical pass result based on whether average is at least 50;
- `class()`, `typeof()` and `str()` calls for selected objects;
- one descriptive attribute attached with `attr()`;
- comments explaining the steps.

Save as `My_Week2_Assignment.R` and follow your lecturer's submission instructions.

## 14. Exit ticket

Predict the output, run the code, and explain the result:

```r
score <- 70
new_score <- score + 10
new_score
score
```

## 15. Before you finish

- [ ] I can evaluate simple expressions.
- [ ] I can assign and reassign values.
- [ ] I can create numeric, character and logical objects.
- [ ] I can perform computations using objects.
- [ ] I can use `class()`, `typeof()` and `str()`.
- [ ] I can inspect and attach a simple attribute.
- [ ] I can explain the difference between a calculation and reassignment.
- [ ] I saved my R script in the correct project folder.

### Reference links

- R Project: https://www.r-project.org/
- An Introduction to R: https://cran.r-project.org/doc/manuals/r-release/R-intro.html
- `class()`: https://stat.ethz.ch/R-manual/R-devel/library/base/html/class.html
- `typeof()`: https://stat.ethz.ch/R-manual/R-devel/library/base/html/typeof.html
- `str()`: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/str.html
- `attributes()`: https://stat.ethz.ch/R-manual/R-devel/library/base/html/attributes.html
