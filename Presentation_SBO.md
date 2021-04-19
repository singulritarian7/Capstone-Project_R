
Presentation_Capstone. Top Three Next Words Predictions 
========================================================
author: Beatriz Jiménez Franco
date: 
autosize: true

Link shinyapp: 
 
<https://mimispoke.shinyapps.io/Shiny_Algorithm/>

 Text prediction via N-gram Stupid Back-off models
========================================================

## Building text predictors

Given the training corpus, the workflow for building the text-predictor consists of the following steps:

- Preprocessing. Apply some transformations to the training corpus before   k-gram extraction.
- Sentence tokenization. Split the training corpus into sentences.
- Extract k-gram frequencies. These are the building blocks for any N-gram language model.
- Train a text predictor. Build a prediction function f, which takes some text input and returns as output three next-word predictions, ordered by decreasing probability.

Also, i built a priori a model dictionary during the training process. It covers 74 % of the training corpus with a length of 1000 words.

Word Coverage Fraction of the rank sorted dictionary
========================================================


```
Word coverage fraction

Dictionary length: 1000 
Coverage fraction (w/ EOS): 74.2 %
Coverage fraction (w/o EOS): 72.4 %
```

![plot of chunk unnamed-chunk-1](Presentation_SBO-figure/unnamed-chunk-1-1.png)

3_N_Gram Model(Trigrams Table)
========================================================

The first two columns correspond to the words of 2-gram prefixes observed in the training corpus, and the other columns correspond to the top three predictions for these 2-grams. When a 2-gram w1w2 is given as input for text prediction, it is first looked for in the prefix columns of trigrams table. If not found, w2 is looked for in the prefix column of bigrams table. If this also fails, the prediction is performed without any prefix, that is, we simply predict the most frequent words in unigrams.


```
      w1  w2 prediction1 prediction2 prediction3
[1,] 657 529           1           4          86
[2,] 713 238           1           4          10
[3,]  78 832           1           3          35
[4,] 904 127           1           3           2
[5,] 749 367           1           4          10
[6,] 105 600           1           9           2
```

Example of shinyapp predictions
========================================================

Enter "i love" and press the submit  buttom, it will returns the top 3 next word predictions:(NOT ONLY ONE!). Word "the" has the higher probability, "you" has the second top probability and "it" the third top probability.


```
[1] "the" "you" "it" 
```

You will also see in the shiny the top 5 predictions and their probabilities: 

```
# A tibble: 5 x 2
  completion probability
  <chr>            <dbl>
1 the             0.135 
2 you             0.0693
3 it              0.0613
4 to              0.0560
5 this            0.0480
```





