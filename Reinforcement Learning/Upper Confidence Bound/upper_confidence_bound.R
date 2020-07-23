#Importing the dataset
dataset = read.csv('Ads_CTR_Optimisation.csv')

#Implementing UCB
N = 10000
d = 10
ads_selected = integer()
n_selections = integer(d)
sum_rewards = integer(d)
total_reward = 0

for (n in 1:N) {
  ad = 0
  max_upper_bound = 0
  for (i in 1:d) {
    if (n_selections[i] > 0) {
      avg_reward = sum_rewards[i] / n_selections[i]
      delta_i = sqrt(3/2 * log(n) / n_selections[i])
      upper_bound = avg_reward + delta_i
    }
    else {
      upper_bound = 1e400
      }
    if (upper_bound > max_upper_bound) {
      max_upper_bound = upper_bound
      ad = i
    }
  }
  ads_selected = append(ads_selected, ad)
  n_selections[ad] = n_selections[ad] + 1
  reward = dataset[n, ad]
  sum_rewards[ad] = sum_rewards[ad] + reward
  total_reward = total_reward + reward
}

#Visualizing the results
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')

