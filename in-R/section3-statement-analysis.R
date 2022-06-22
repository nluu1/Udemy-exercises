##Requirement:
# results in vector
# no decimal points

#Functions:
# round()
# mean()
# max()
# min()

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

##Calculate the following:
# profit each month
profit <- revenue - expenses
profit

# profit after tax each month (30% rate)

tax <- round(profit * 0.3,digits=2)
tax

profit.after.tax <- profit - tax
profit.after.tax

# profit margin each month
#negative profit margin indicates loss
profit.margin <- round(profit.after.tax / revenue,2) *100
profit.margin

# good months - where profit after tax was grater than the mean
mean_pat <- mean(profit.after.tax)
mean_pat

good.months <- profit.after.tax > mean_pat
good.months

# bad months - where profit after tax is less than the mean
bad.months <-  !good.months
bad.months

# the best month-when profit after tax is max
best.month <- profit.after.tax == max(profit.after.tax)
best.month
# the worst month-when profit after tax is min
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#units of thousands
rev.1000 <- round(revenue/1000)
exp.1000 <- round(expenses/1000)
profit.1000 <- round(profit/1000)
profit.after.tax.1000 <- round(profit.after.tax/1000)

#Output
rev.1000
exp.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#matrices
m <- rbind(
    rev.1000,
    exp.1000,
    profit.1000,
    profit.after.tax.1000,
    profit.margin,
    good.months,
    bad.months,
    best.month,
    worst.month
)
m
