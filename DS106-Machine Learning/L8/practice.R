trials <-10000
alpha <- 9
beta <- 1

samplesA <- rbeta(trials, 27+alpha, 39 + beta)
samplesB <- rbeta(trials, 10+alpha, 45 + beta)

Bsuperior <- sum(samplesB > samplesA) / trials

