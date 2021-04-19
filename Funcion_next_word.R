nextword <- function(n, input, data) {
  library(sbo)
  
  # p es un objeto sbo, mirar la viÃ±eta
  # y hay que definirlo antes de abrir la funciÃ³n
  # mirar en el directorio Proyecto _Capstone_def, SBO.Rmd, 
  # para saber cÃ³mo  obtener p
  
  # p <- sbo_predictor(object = data, # 50k tweets, example dataset
  # N = n, # Train a 3-gram model
  # dict = dict, # Top 1k words appearing in corpus
  .# preprocess = sbo::preprocess, # Preprocessing transformation
  # EOS = ".?!:;" # End-Of-Sentence characters
  #)
  
  prediction <- predict(object = p, input = input)
  prediction
}


sbo_f_prediction <- function(input, data) {
  library(sbo)
  
  # data es el corpus, un vector de caracteres
  # solo para 3 N_Grams
  # dict es un diccionario predefinido,mirar viÃ±eta de sbo
  # y hay que definirlo antes de abrir la funciÃ³n
  # f es un objeto sbo_kgram_freqs, mirar viÃ±eta paquete sbo
  # y hay que definirlo antes de abrir la funciÃ³n
  
  # fpred <- kgram_freqs_fast(data, N = n, dict = dict,
  #  erase = "[^.?!:;'\\w\\s]", lower_case = TRUE,
  # EOS = ".?!:;")
  
  # Mirar en el directorio Proyecto Shiny_Algorithm, SBO.Rmd, para saber cÃ³mo 
  # obtener fpred
  
  # Ejemplo:
  
  # sbo_f_prediction("i love", train_c)
  # A tibble: 1,001 x 2
  # completion probability
  # <chr>            <dbl>
  #  1 the             0.135 
  # 2 you             0.0693
  # 3 it              0.0613
  # 4 to              0.0560
  # 5 this            0.0480
  
  fpred <- readRDS("fpred.rds")
  predictions_f <- predict(fpred, input = input)
  predictions_f
}


sbo_t_prediction <- function(input, data) {
  
  library(sbo)
  
  # data es el corpus, un vector de caracteres
  # sÃ³lo para 3 N_Grams
  # dict es un diccionario predefinido,mirar viÃ±eta de sbo
  # t es un objeto clase "sbo_predtable"   "sbo_predictions",
  # mirar viÃ±eta paquete sbo 
  # y hay que definirlo antes de abrir funciÃ³n
  # mirar en el directorio Proyecto _Capstone_def, SBO.Rmd,
  # para saber cÃ³mo obtener tpred
  
  # Ejemplo:
  
  # sbo_t_prediction("i love, train_c")
  # [1] "and"  "with" "to"  
  
  # tpred <- sbo_predtable(object = data, # preloaded example dataset
  # N = n, # Train a number of N-gram model
  # dict = dict, # cover % of data or  with a max length of words
  # .preprocess = sbo::preprocess, # Preprocessing transformation 
  # EOS = ".?!:;", # End-Of-Sentence tokens
  # lambda = 0.4, # Back-off penalization in SBO algorithm
  # L = 3L, # Number of predictions for input
  # filtered = "<UNK>" # Exclude the <UNK> token from predictions
  #)
  tpred <- readRDS("tpred.rds")
  p <- sbo_predictor(tpred)# This is the same as 'p' created above
  predictions_t <- predict(p, input)
  predictions_t
}

# source("Function_next_word") Para abrir documento en working directory, y luego llamar a función
